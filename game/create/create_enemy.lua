function create_enemy(x,y,z)
	local enemy = newobj("enemy",1)
	enemy.sprite = loadsprite("enemy")
	enemy.pos = {x=x,y=y,z=z}
	enemy.vel = {x=0,y=0,z=0}
	enemy.acc = {x=0,y=0,z=0}
	enemy.rad = 1
	enemy.color = {1,0,1}
	enemy.update = enemyupdate
	enemy.draw = enemydraw
	enemy.timer = 0
	enemy.angle = math.atan2((player.pos.y - enemy.pos.y),(player.pos.x - enemy.pos.x))
	enemy.anglespeed = 0
	enemy.maxspeed = 2
	enemy.angledisp = 0
	enemy.foe = 1
	enemy.targetangle = 0
	enemy.mspeed = 2
	enemy.state = "idle"
	enemy.aggrorange = 5
	enemy.crad = 20
	enemy.speed = 0
	enemy.acceleration = 2/30
	enemy.collides = 1
	enemy.mass = 1
	enemy.health = 10
	enemy.scale = .7
	enemy.flash = 0
	enemy.top = 0
	enemy.bottom = 0
	enemy.markedfordeath = 0
	enemy.hitbox = {
		size = 50,
		height = enemy.sprite.base:getHeight()*enemy.scale/2
	}
end


function enemyupdate(o)
	if o.flash == 1 then
		o.flash = 0
	end
	o.timer = o.timer + love.timer.getDelta()
	--	o.acc.x = o.acceleration*math.cos(o.targetangle)
	--	o.acc.y = o.acceleration*math.sin(o.targetangle)
	--o.scale = (math.cos(o.timer)+1)/2
	local pi = math.pi
	--o.pos.z = 10*math.sin(o.timer*2 + o.ID)
	if dist(o.pos.x,o.pos.y,player.pos.x,player.pos.y) < o.aggrorange then
		o.state = "chase"

	else
		o.state = "idle"
		o.vel.x = 0
		o.vel.y = 0
		o.acc.x = 0
		o.acc.y = 0
	end

	if o.state == "chase" then
		o.targetangle = math.atan2((player.pos.y - o.pos.y),(player.pos.x - o.pos.x))
		o.timer = o.timer + love.timer.getDelta()
		o.acc.x = o.acceleration*math.cos(o.targetangle)
		o.acc.y = o.acceleration*math.sin(o.targetangle)
		--o.pos.z = 100 + 5*math.sin(o.timer*16+(16*o.ID/5))
	else
		o.pos.z = 0
	end
	o.vel.x = o.vel.x + o.acc.x
	o.vel.y = o.vel.y + o.acc.y
	o.angle = math.atan2((o.vel.y),(o.vel.x))
	o.speed = math.sqrt((o.vel.x)^2 + (o.vel.y)^2)
	if o.speed > o.maxspeed then
		o.vel.x = o.maxspeed*math.cos(o.angle)
		o.vel.y = o.maxspeed*math.sin(o.angle)
	end
	

	o.pos.x = o.pos.x + o.vel.x
	o.pos.y = o.pos.y + o.vel.y

	o.top = o.pos.z+field.depth-(o.sprite.base:getHeight()/2)*o.scale
	o.bottom = o.pos.z+field.depth
	for i=1, #list.update do
		if list.update[i] ~= nil then
			if list.update[i].name == "bullet" then
				local b = list.update[i]
				if dist(o.pos.x,o.pos.y,b.pos.x,b.pos.y) < o.hitbox.size and b.pos.z < o.bottom and b.pos.z > o.top then
					o.health = o.health - b.damage
					o.flash = 1
					b:kill()
				else
					o.flash = 0
				end
			end
		end
	end

	if o.markedfordeath == 1 then
		o:kill()
	end

	if o.health <= 0 then
		o.markedfordeath = 1
	end
	

	
	o.layer = dist(camera.pos.x,camera.pos.y,o.pos.x,o.pos.y)
	sortdrawlist()
end


function enemydraw(o)
	--circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.rad,o.color)
	if o.state == "idle" then
		o.sprite.animations.idle:anim(o.angle,o.pos.x,o.pos.y,o.pos.z,0,o.scale,1,o.flash)
	elseif o.state == "chase" then
		--o.sprite.animations.walk:anim(o.angle,o.pos.x,o.pos.y,o.pos.z,0,.4,1)
	end
	love.graphics.setColor(1,1,1)
	--circle3D("line",o.pos.x,o.pos.y,o.pos.z+field.depth,o.hitbox.size,{0,0,1})
	--circle3D("line",o.pos.x,o.pos.y,o.pos.z+field.depth-(o.sprite.base:getHeight()/2)*o.scale,o.hitbox.size,{0,1,0})
	--[[line3D(
		o.pos.x,
		o.pos.y,
		o.pos.z+field.depth,
		o.pos.x,
		o.pos.y,
		o.pos.z+field.depth-(o.sprite.base:getHeight()/2)*o.scale,
		{1,1,1})
	printer3D(field.depth,o.pos.x,o.pos.y,(o.pos.z+field.depth)/2)]]--
	--[[love.graphics.circle("line",s.w2,s.h2+300,100)
	love.graphics.setColor(1,0,0)
	love.graphics.line(s.w2,s.h2+300,s.w2+100*math.cos(o.angle),s.h2+300+100*math.sin(o.angle))
	love.graphics.setColor(1,1,1)
	love.graphics.line(s.w2,s.h2+300,s.w2+100*math.cos(o.targetangle),s.h2+300+100*math.sin(o.targetangle))]]--
--[[
	love.graphics.circle("line",s.w2+o.pos.x,s.h2+o.pos.y,o.crad)
	love.graphics.print(o.speed,s.w2+o.pos.x,o.pos.y+s.h2)
	love.graphics.line(s.w2+o.pos.x,s.h2+o.pos.y,s.w2+o.pos.x+o.crad*math.cos(o.angle),s.h2+o.pos.y+o.crad*math.sin(o.angle))]]--
end