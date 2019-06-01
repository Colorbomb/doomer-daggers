function create_player()
	player = newobj("player",1)
	player.pos = {x=s.w2,y=s.h2,z=0}
	player.vel = {x=0,y=0,z=0}
	player.rad = 30
	player.color = {1,.3,0}
	player.update = playerupdate
	player.draw = playerdraw
	player.angle = 0
end


function playerupdate(o)
	if keyboard.btns.w.down == 1 then
		o.vel.y = 10
	elseif keyboard.btns.s.down == 1 then
		o.vel.y = -10
	elseif keyboard.btns.s.down == 1 and keyboard.btns.w.down == 1 then
		o.vel.y = 0
	else
		o.vel.y = 0
	end

	if keyboard.btns.d.down == 1 then
		o.vel.x = 10
	elseif keyboard.btns.a.down == 1 then
		o.vel.x = -10
	elseif keyboard.btns.d.down == 1 and keyboard.btns.a.down == 1 then
		o.vel.x = 0
	else
		o.vel.x = 0
	end



	o.pos.x = o.pos.x + o.vel.x
	o.pos.y = o.pos.y + o.vel.y
end


function playerdraw(o)
	circle("fill",o.pos.x,o.pos.y,o.rad,{1,1,1})
end