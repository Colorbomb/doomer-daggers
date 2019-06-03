function create_collider()

	collider = newobj("collider", 0)
	collider.update = colliderupdate
end

function colliderupdate()
	local clist = list.update
	for i=1,#clist do
		if clist[i].collides == 1 then
			for j=1, #clist do
				if clist[i].hash ~= clist[j].hash and clist[j].collides == 1 then
					if dist(clist[i].pos.x, clist[i].pos.y,clist[j].pos.x,clist[j].pos.y) < clist[i].crad+clist[j].crad then
						local fscale = love.timer.getDelta()*60
						if math.abs(clist[i].speed) > math.abs(clist[j].speed) then
							b1 = clist[i]
							b2 = clist[j]
						else
							b1 = clist[j]
							b2 = clist[i]
						end
						local dtm = b1.crad+b2.crad - dist(b1.pos.x,b1.pos.y,b2.pos.x,b2.pos.y)
						local incangle = math.atan2((b2.pos.y - b1.pos.y),(b2.pos.x - b1.pos.x))
						b1.pos.x = b1.pos.x - dtm*math.cos(incangle)
						b1.pos.y = b1.pos.y - dtm*math.sin(incangle)
						if b1.immovable == 1 then
							b2.pos.x = b2.pos.x - dtm*math.cos(incangle)
							b2.pos.y = b2.pos.y - dtm*math.sin(incangle)
						end

						b1.vel.x = fscale*((b1.speed*math.cos(b1.angle - incangle)*(b1.mass - b2.mass) + 2*b2.mass*b2.speed*math.cos(b2.angle - incangle))/(b1.mass + b2.mass))*math.cos(incangle) + b1.speed*math.sin(b1.angle-incangle)*math.sin(-incangle)
						b1.vel.y = fscale*((b1.speed*math.cos(b1.angle - incangle)*(b1.mass - b2.mass) + 2*b2.mass*b2.speed*math.cos(b2.angle - incangle))/(b1.mass + b2.mass))*math.sin(incangle) + b1.speed*math.sin(b1.angle-incangle)*math.cos(-incangle)
						--love.timer.sleep(1)
						--b1.angle = math.atan2((b1.vel.y),(b1.vel.x))

						b2.vel.x = fscale*((b2.speed*math.cos(b2.angle - incangle)*(b2.mass - b1.mass) + 2*b1.mass*b1.speed*math.cos(b1.angle - incangle))/(b2.mass + b1.mass))*math.cos(incangle) + b2.speed*math.sin(b2.angle-incangle)*math.sin(-incangle)
						b2.vel.y = fscale*((b2.speed*math.cos(b2.angle - incangle)*(b2.mass - b1.mass) + 2*b1.mass*b1.speed*math.cos(b1.angle - incangle))/(b2.mass + b1.mass))*math.sin(incangle) + b2.speed*math.sin(b2.angle-incangle)*math.cos(-incangle)
					
						--b2.angle = math.atan2((b2.vel.y),(b2.vel.x))
					end
				end
			end
		end
	end

end