function create_enemy(x,y,z,i)
	enemy = newobj("enemy",1)
	enemy.pos = {x=x,y=y,z=z}
	enemy.vel = {x=0,y=0,z=0}
	enemy.rad = 1
	enemy.ID = i
	enemy.color = {1,0,1}
	enemy.update = enemyupdate
	enemy.draw = enemydraw
	enemy.timer = 0
	enemy.angle = 0
end


function enemyupdate(o)
	o.timer = o.timer + love.timer.getDelta()
	o.pos.z = 10*math.sin(o.timer*2 + o.ID)
	o.pos.x = o.pos.x + o.vel.x
	o.pos.y = o.pos.y + o.vel.y
end


function enemydraw(o)
	circle3D("fill",o.pos.x,o.pos.y,o.pos.z,o.rad,o.color)
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