function create_exampleobject()
	exampleobject = newobj("exampleobject", 1) -- creates a new object named "example object", on layer 1.
	exampleobject.pos = {x = 0, y = 0} -- define the position of the object
	exampleobject.timer = 0 -- give it a way to keep track of time
	exampleobject.rad = 25 -- the radius of the object to be drawn
	exampleobject.color = {1,1,0} --let's make it yellow

	exampleobject.update = exampleobject_update
	exampleobject.draw = exampleobject_draw
end
--create a new object! it will use exampleobject_update and exampleobject_draw as it's update and draw functions, respectively

function exampleobject_update(o)
	o.timer = o.timer + love.timer.getDelta()
	o.pos.x = s.w2+s.w2*math.cos(o.timer)
	o.pos.y = s.h2+s.h2*math.sin(o.timer) --makes the object circle around the screen
	if keyboard.btns.space.pulse == 1 then --checks to see if the spacebar is down this frame
		o:kill() -- kills the object
	end
end


function exampleobject_draw(o)
	circle("fill",o.pos.x,o.pos.y,o.rad,o.color)
end
--draws the object as a circle