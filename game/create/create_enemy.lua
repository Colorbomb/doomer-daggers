function create_enemy()
	enemy = newobj("enemy",1)
	enemy.pos = {x=s.w2 + 100,y=s.h2,z=0}
	enemy.vel = {x=0,y=0,z=0}
	enemy.rad = 10
	enemy.color = {1,0,1}
	enemy.update = enemyrupdate
	enemy.draw = enemydraw
	enemy.angle = 0
end


function enemyupdate(o)
	o.pos.x = o.pos.x + o.vel.x
	o.pos.y = o.pos.y + o.vel.y
end


function enemydraw(o)
	circle("fill",o.pos.x,o.pos.y,o.rad,o.color)
end