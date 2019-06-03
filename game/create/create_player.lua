function create_player()
	player = newobj("player",1)
	player.pos = {x=0,y=0,z=0}
	player.vel = {x=0,y=0,z=0}
	player.vel2 = {x=0,y=0,z=0}
	player.rad = 30
	player.color = {1,.3,0}
	player.update = playerupdate
	player.draw = playerdraw
	player.angle = 0
	player.speed = 0
	player.walk = 2
	player.sprint = player.walk * 2
end


function playerupdate(o)
	if keyboard.btns.lshift.down == 1 then
		o.speed = o.sprint
	else
		o.speed = o.walk
	end
	if keyboard.btns.w.down == 1 then
		o.vel.x = o.speed
	elseif keyboard.btns.s.down == 1 then
		o.vel.x = -o.speed
	elseif keyboard.btns.s.down == 1 and keyboard.btns.w.down == 1 then
		o.vel.x = 0
	else
		o.vel.x = 0
	end

	if keyboard.btns.d.down == 1 then
		o.vel.y = -o.speed
	elseif keyboard.btns.a.down == 1 then 
		o.vel.y = o.speed
	elseif keyboard.btns.d.down == 1 and keyboard.btns.a.down == 1 then
		o.vel.y = 0
	else
		o.vel.y = 0
	end

	o.vel2.x = o.vel.x*math.cos(o.angle) + o.vel.y*math.sin(o.angle)
	o.vel2.y = -o.vel.y*math.cos(o.angle) + o.vel.x*math.sin(o.angle)

	o.pos.x = o.pos.x + o.vel2.x
	o.pos.y = o.pos.y + o.vel2.y

	o.angle = (o.angle + mouse.vel.x/60)%(2*math.pi)
	camera.pos.x = o.pos.x
	camera.pos.y = o.pos.y
	camera.angle = o.angle

end


function playerdraw(o)
	love.graphics.setColor(1,0,0)
	--love.graphics.circle("fill",o.pos.x+s.w2,s.h2+o.pos.y,o.rad)
	--line(o.pos.x,o.pos.y,o.pos.x + o.rad*math.cos(o.angle),o.pos.y + o.rad*math.sin(o.angle),1,{0,0,0})
	--printer("x  = "..o.pos.x,0,0,"left","top",{1,1,1})
	--printer("y  = "..o.pos.y,0,10,"left","top",{1,1,1})
end