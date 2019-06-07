function love.load()
	require("color_library.initialize.initializer")
	initializer("fullscreen",800,600) -- this line, and the line above, MUST be run in order to access all of the functions in the library.
	create_collider()
	create_field(2000,80,80)
	create_player()
	for i=1, 1 do
		create_enemy(100,200*(i-1)-200,100,i)
	end
	
	--create_player2()
	for i=1, 10 do
		--create_enemy2(100,10*(i-1),1*(i-1))
	end
	
end
function love.mousemoved( x, y, dx, dy, istouch )

	mouse.vel.x = dx*love.timer.getDelta()*player.sensitivity.x
	mouse.vel.y = dy*love.timer.getDelta()*player.sensitivity.y
end

function love.update(dt)
	list:updateall()
	mouse.vel.x = 0
	mouse.vel.y = 0
end



function love.draw()
	list:drawall()
	--love.graphics.line(s.w2,0,s.w2,s.h)
	--love.graphics.line(0,s.h2,s.w,s.h2)
	love.graphics.print(#list.update,0,200)
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end