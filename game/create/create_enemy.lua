function create_enemy(x,y,z,i)
	local enemy = newobj("enemy",1)
	enemy.sprite = loadsprite("enemy")
	enemy.pos = {x=x,y=y,z=z}
	enemy.vel = {x=0,y=0,z=0}
	enemy.acc = {x=0,y=0,z=0}
	enemy.rad = 1
	enemy.ID = i
	enemy.color = {1,0,1}
	enemy.update = enemyupdate
	enemy.draw = enemydraw
	enemy.timer = 0
	enemy.angle = math.atan2((player.pos.y - enemy.pos.y),(player.pos.x - enemy.pos.x))
	enemy.anglespeed = 0
	enemy.maxspeed = 2
	enemy.angledisp = 0
	enemy.targetangle = 0
	enemy.mspeed = 2
	enemy.state = "idle"
	enemy.aggrorange = 5
	enemy.crad = 20
	enemy.speed = 0
	enemy.acceleration = 2/30
	enemy.collides = 1
	enemy.mass = 1
end


function enemyupdate(o)
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
		o.pos.z = 100
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
	
	o.layer = dist(camera.pos.x,camera.pos.y,o.pos.x,o.pos.y)
	sortdrawlist()
end


function enemydraw(o)
	--circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.rad,o.color)
	if o.state == "idle" then
		o.sprite.animations.idle:anim(o.angle,o.pos.x,o.pos.y,o.pos.z,0,.15,.15,1)
	elseif o.state == "chase" then
		o.sprite.animations.walk:anim(o.angle,o.pos.x,o.pos.y,o.pos.z,0,.15,.15,1)
	end
	love.graphics.setColor(1,1,1)

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
























function create_enemy2(x,y)
	enemy2 = newobj("enemy",1)
	enemy2.pos = {x=x,y=y,z=0}
	enemy2.vel = {x=0,y=0,z=0}
	enemy2.rad = 1
	enemy2.color = {1,0,1}
	enemy2.update = enemyrupdate2
	enemy2.draw = enemydraw2
	enemy2.angle = 0
end


function enemyupdate2(o)
	o.pos.x = o.pos.x + o.vel.x
	o.pos.y = o.pos.y + o.vel.y
end


function enemydraw2(o)
	love.graphics.setColor(1,0,0)
	love.graphics.circle("fill",s.w2+o.pos.x,s.h2+o.pos.y,5)
	love.graphics.setColor(1,1,1)
end