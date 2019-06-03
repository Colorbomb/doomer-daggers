function love.load()
	require("color_library.initialize.initializer")
	initializer("fullscreen",800,600) -- this line, and the line above, MUST be run in order to access all of the functions in the library.
	create_collider()
	create_player()
	for i=1, 10 do
		create_enemy(100,200*(i-1),100,i)
	end
	
	--create_player2()
	for i=1, 10 do
		--create_enemy2(100,10*(i-1),1*(i-1))
	end
	create_field(2000,40,40)
end
function love.mousemoved( x, y, dx, dy, istouch )

	mouse.vel.x = dx
	mouse.vel.y = dy
end

function love.update(dt)
	list:updateall() --updates everything in the updatelist
	mouse.vel.x = 0
	mouse.vel.y = 0
end

--in lua, the syntax for running an object's function with the object itself being the first input argument is object:function()


function love.draw()
	list:drawall() --draws everything in the drawlist
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end