function create_player()
	player = newobj("player",1)
	create_gun()
	player.pos = {x=0,y=0,z=0}
	player.vel = {x=0,y=0,z=0}
	player.acc = {x=0,y=0,z=field.grav}
	player.acc2 = {x=0,y=0,z=0}
	player.velangle = 0
	player.acceleration = 1
	player.rad = 30
	player.sensitivity = {x = 20, y = 20*(16/9)}
	player.looklimit = math.rad(90)
	player.color = {1,.3,0}
	player.update = playerupdate
	player.draw = playerdraw
	player.angle = 0
	player.angle2 = 0
	player.friction = .1
	player.jump = 0
	player.speed = 0
	player.maxspeed = 8
	player.maxspeedorig = 4
	player.walk = 2
	player.sprint = player.walk * 2
end


function playerupdate(o)
	if keyboard.btns.r.pulse == 1 then
		create_enemy(o.pos.x+math.cos(o.angle)*400,o.pos.y+math.sin(o.angle)*400,o.pos.z)
	end
	if keyboard.btns.lshift.down == 1 then
		o.speed = o.sprint
	else
		o.speed = o.walk
	end
	if keyboard.btns.w.down == 1 then
		o.acc.x = o.acceleration
	elseif keyboard.btns.s.down == 1 then
		o.acc.x = -o.acceleration
	elseif keyboard.btns.s.down == 1 and keyboard.btns.w.down == 1 then
		o.acc.x = 0
	else
		o.acc.x = 0
	end

	if keyboard.btns.d.down == 1 then
		o.acc.y = -o.acceleration
	elseif keyboard.btns.a.down == 1 then 
		o.acc.y = o.acceleration
	elseif keyboard.btns.d.down == 1 and keyboard.btns.a.down == 1 then
		o.acc.y = 0
	else
		o.acc.y = 0
	end



	o.acc2.x = o.acc.x*math.cos(o.angle) + o.acc.y*math.sin(o.angle)
	o.acc2.y = -o.acc.y*math.cos(o.angle) + o.acc.x*math.sin(o.angle)
	o.acc2.z = o.acc.z

	if o.jump == 0 and keyboard.btns.space.pulse == 1 then
		o.jump = 1
		o.vel.z = -10
	end

	if ((keyboard.btns.w.down ~= 1) and (keyboard.btns.a.down ~= 1) and (keyboard.btns.s.down ~= 1) and (keyboard.btns.d.down ~= 1)) then
		if o.speed > 0 then
			o.acc2.x = o.friction*math.cos(o.velangle+math.pi)
			o.acc2.y = o.friction*math.sin(o.velangle+math.pi)
		end
	end


	o.vel.x = o.vel.x + o.acc2.x
	o.vel.y = o.vel.y + o.acc2.y
	o.vel.z = o.vel.z + o.acc2.z

	if o.pos.z == 0 and o.jump == 0 then
		o.vel.z = 0
	end

	if o.vel.z > 0 and o.jump == 1 then
		o.vel.z = 0
		o.jump = 0
	end




	o.speed = math.sqrt(o.vel.x^2 + o.vel.y^2)
	o.velangle = math.atan2((o.vel.y),(o.vel.x))
	--[[if (keyboard.btns.d.down == 1 or keyboard.btns.a.down == 1) and (keyboard.btns.w.down == 1 or keyboard.btns.s.down == 1) then
		o.maxspeed = o.maxspeedorig/math.sqrt(2)
	else
		o.maxspeed = o.maxspeedorig
	end]]--
	
	if o.speed > o.maxspeed then
		o.vel.x = o.maxspeed*math.cos(o.velangle)
		o.vel.y = o.maxspeed*math.sin(o.velangle)
	end 

	if ((keyboard.btns.w.down ~= 1) and (keyboard.btns.a.down ~= 1) and (keyboard.btns.s.down ~= 1) and (keyboard.btns.d.down ~= 1)) and o.speed < .5 then
		o.vel.x = 0
		o.vel.y = 0
	end



	o.pos.x = o.pos.x + o.vel.x
	o.pos.y = o.pos.y + o.vel.y
	o.pos.z = o.pos.z + o.vel.z
	
	if o.pos.z >= 0 then
		o.pos.z = 0
	end


	o.angle = (o.angle + mouse.vel.x/60)%(2*math.pi)
	o.angle2 = (o.angle2 + mouse.vel.y/60)

	if o.angle2 >= player.looklimit then
		o.angle2 = player.looklimit
	elseif o.angle2 <= -player.looklimit then
		o.angle2 = -player.looklimit
	end
	camera.pos.x = o.pos.x
	camera.pos.y = o.pos.y
	camera.pos.z = o.pos.z

	camera.angle = o.angle
	camera.angle2 = o.angle2

end


function playerdraw(o)
	love.graphics.setColor(1,0,0)
	love.graphics.print("angle2:  "..math.deg(o.angle2),0,0)
	--love.graphics.print(math.deg(o.looklimit),0,10)
	--love.graphics.circle("fill",o.pos.x+s.w2,s.h2+o.pos.y,o.rad)
	love.graphics.setColor(1,1,1)
	--love.graphics.line(o.pos.x+s.w2,o.pos.y+s.h2,o.pos.x+s.w2 + o.rad*math.cos(o.angle),o.pos.y+s.h2 + o.rad*math.sin(o.angle))
	love.graphics.print("z vel  = "..o.vel.z,0,100)
	love.graphics.print("z pos  = "..o.pos.z,0,110)
	--printer("y  = "..o.pos.y,0,10,"left","top",{1,1,1})
end

function create_gun()
	gun = newobj("gun",0)
	create_ammocounter()
	gun.update = gunupdate
	gun.xoff = 0
	gun.yoff = 0
	gun.zoff = 0
	gun.offset = 50
	gun.offsetter = 30
	gun.offsetreal = {x=0,y=0,z=0}
	gun.draw = gundraw
	gun.bulletcolors = {
			{1,.1,0},
			{.7,.2,1},
			{.1,1,.1},
			{1,1,1},
		}

	gun.ammo = 4

	create_crosshair()
end

function gunupdate(o)
	--o.xoff = player.pos.x --+ offsetter*math.cos(camera.angle) + offsetter*math.sin(camera.angle)
	--o.yoff = player.pos.y --- offsetter*math.cos(camera.angle) + offsetter*math.sin(camera.angle)
	--o.zoff = player.pos.z - o.offsetter*math.cos(camera.angle2) -- offsetter*math.sin(camera.angle2)--*(offsetter*math.cos(camera.angle) + offsetter*math.sin(camera.angle))
	o.offsetreal = {x= player.pos.x+o.offsetter*math.sin(-camera.angle2)*(math.cos(camera.angle)),y= player.pos.y+o.offsetter*math.sin(-camera.angle2)*(math.sin(camera.angle)),z=player.pos.z/2+o.offsetter*math.cos(-camera.angle2)}

	if mouse.button1.pulse == 1 then
		create_playerbullet(gun.ammo)
		gun.ammo = gun.ammo - 1	
		if gun.ammo == 1 then
			crosshair.color = {1,0,0}
		else
			crosshair.color = {1,1,1}
		end
		if gun.ammo == 0 then
			gun.ammo = 4
		end	
	end
end

function gundraw(o)
	--line3D(0,0,0,o.offsetreal.x, o.offsetreal.y, o.offsetreal.z,{1,1,1})
	--circle3D("fill",o.offsetreal.x,o.offsetreal.y,o.offsetreal.z,4,{1,1,1})
	--love.graphics.line(0,0,s.w,s.h)
end


function create_playerbullet(bnum)
	local b = newobj("bullet",1)
	
	local speed = 50
	local size = 10
	if bnum == 1 then
		speed = 75
		size = 5
	end
	local randomount = math.pi/128
	local anglefuck = ((math.random()*2)-1)*randomount
	local anglefuck2 = ((math.random()*2)-1)*randomount/2.25
	local damage = 0


	if gun.ammo == 1 then
		anglefuck = 0
		anglefuck2 = 0
		damage = 2
	else
		damage = 1
	end

		--print("anglefuck",math.deg(anglefuck))


	b.pos = {x=gun.offsetreal.x,y=gun.offsetreal.y--[[+(offset*math.sin(camera.angle))*math.cos(camera.angle2)]],z=gun.offsetreal.z}
	b.vel = {x=speed*math.cos(camera.angle+anglefuck),y=speed*math.sin(camera.angle+anglefuck),z=speed*math.sin(camera.angle2/2.25 + anglefuck2)}
	b.num = bnum
	b.damage = damage
	b.size = size
	b.dist = 50
	b.angle = camera.angle
	b.angle2 = camera.angle2
	b.speed = speed
	b.killrange = 4000
	if bnum == 4 then
		b.update = pbulletupdate4
		b.draw = pbulletdraw4
	elseif bnum == 3 then
		b.update = pbulletupdate3
		b.draw = pbulletdraw3
	elseif bnum == 2 then
		b.update = pbulletupdate2
		b.draw = pbulletdraw2
	elseif bnum == 1 then
		b.update = pbulletupdate1
		b.draw = pbulletdraw1
	end
end

function bulletmove(x,y,z,velx,vely,velz)
	local pos = {
		x = x + velx,
		y = y + vely,
		z = z + velz,
	}
	return pos
end

function genericbullet(o)
	o.pos = bulletmove(o.pos.x,o.pos.y,o.pos.z,o.vel.x,o.vel.y,o.vel.z)
	o.dist = dist3D(o.pos.x,o.pos.y,o.pos.z,player.pos.x,player.pos.y,player.pos.z)
	o.layer = o.dist

	if o.dist >= o.killrange then
		o:kill()
	end
end

function pbulletupdate4(o)
	o = genericbullet(o)	
end

function pbulletupdate3(o)
	o = genericbullet(o)
end

function pbulletupdate2(o)
	o = genericbullet(o)
end

function pbulletupdate1(o)
	o = genericbullet(o)
end

function pbulletdraw4(o)
	circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.size,gun.bulletcolors[4])
end

function pbulletdraw3(o)
	circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.size,gun.bulletcolors[4])
end

function pbulletdraw2(o)
	circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.size,gun.bulletcolors[4])
end

function pbulletdraw1(o)
	circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.size,gun.bulletcolors[1])
end




function create_ammocounter()
	amc = newobj("ammo counter",-1)
	amc.update = ammoupdate
	amc.draw = ammodraw
end

function ammoupdate()

end

function ammodraw()

end


function create_crosshair()
	crosshair = newobj("crosshair",1)
	crosshair.pos = {x=s.w2,y=s.h2-gun.offsetter}
	crosshair.size = 50
	crosshair.update = crosshairupdate
	crosshair.draw = crosshairdraw
	crosshair.color = {1,1,1}
end
function crosshairupdate(o)
end
function crosshairdraw(o)
	line(o.pos.x,o.pos.y-o.size,o.pos.x,o.pos.y+o.size,1,o.color)
	line(o.pos.x+o.size,o.pos.y,o.pos.x-o.size,o.pos.y,1,o.color)
	--love.graphics.line(0,0,s.w,s.h)
end
