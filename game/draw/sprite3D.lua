function sprite3D(input_sprite, input_quad, input_x, input_y, input_z, input_size, input_rotation,input_quadwidth,input_quadheight,input_flash)

	local fieldo = .13/120
	local flat = 120/.13

	local angle = math.atan2((input_y-camera.pos.y),(input_x-camera.pos.x))--%(2*math.pi)
	local angley = math.atan2((input_z-camera.pos.z),math.cos(angle)*(input_x-camera.pos.x)+math.sin(angle)*(input_y-camera.pos.y))
	local anglediff = camera.angle - angle
	local anglediffy = camera.angle2 - angley
	local actualdist = dist(camera.pos.x,camera.pos.y,input_x,input_y)*fieldo
	local distance = actualdist*math.cos(anglediff)
	local x = 0
	anglediff = math.deg(anglediff)
	anglediffy = math.deg(anglediffy)
	if anglediff > 180 then
		anglediff = anglediff - 360
	elseif anglediff < -180 then
		anglediff = anglediff + 360	
	end

	local width = input_quadwidth
	local height = input_quadheight
	local a = 1

	local b = math.sqrt(2)

	x = s.w2 - s.w*(anglediff/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediff)*math.pi/math.rad(camera.fov))+(a+b)/2)
	--x = s.w2 - s.w*(anglediff/camera.fov)
	--x = s.w2 + s.w*math.sin((anglediff/camera.fov)*math.pi/2)
	local y = 0
	b=b*.7
	y = s.h2 + input_z/(distance) - s.h*(anglediffy/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediffy)*math.pi/math.rad(camera.fov))+(a+b)/2)
	local size = (input_size)/(distance)--((dist(camera.pos.x,camera.pos.y,input_x,input_y))*field)




	love.graphics.setColor(1,1,1)
	if input_flash == 1 then
    	love.graphics.setShader(flash)
   		flash:send("WhiteFactor",1)
	end
	if math.abs(anglediff) < (camera.fov*1.2)/2 and distance > .01 then
		--love.graphics.print(subs,x,y+10)
		love.graphics.draw(input_sprite,input_quad,x,y,input_rotation,size,size,width/2,height-field.depth*2/input_size)
		love.graphics.print(height,0,400)
	end
	if input_flash == 1 then
		love.graphics.setShader()
	end
end