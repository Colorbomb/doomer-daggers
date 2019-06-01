function initializer(fulls,width,height)

	require("color_library.initialize.list")
	require("color_library.initialize.initialize_input")
	require("color_library.initialize.camera")
	require("color_library.initialize.sortdrawlist")
	require("color_library.initialize.newobj")

	require("color_library.draw.circle")
	require("color_library.draw.line")
	require("color_library.draw.printer")

	require("color_library.math.dist")
	require("color_library.math.hashtagger")

	require("color_library.exampleobject")

	--gets the graphics and input functions from the color_library

	--put your own function files here!
	
	require("create.create_player")
	require("create.create_enemy")
	require("create.create_player2")


	require("draw.circle3D")

	

	s = {
		desktopw = love.graphics.getWidth(),
		desktoph = love.graphics.getHeight(),
		w = 0,
		w2 = 0,
		h = 0,
		h2 = 0,
		fill = function(self,wid,hei,fs)
			if fs == "fullscreen" then
				love.window.setMode(0,0, {fullscreen= true})
				self.w = love.graphics.getWidth()
				self.h = love.graphics.getHeight()
				self.w2 = self.w/2
				self.h2 = self.h/2
			else
				self.w = wid
				self.h = hei
				self.w2 = self.w/2
				self.h2 = self.h/2
				love.window.setMode(self.w,self.h, {fullscreen= false})
			end
		end
	}
	--[[This is the screen object.
		Important properties (you'll need to know these):
			s.w = the width of the game window
			s.h = the height of the game window
			s.w2 = half the width of the game window
			s.h2 = half the height of the game window		
	]]--
	font = love.graphics.getFont()
	love.graphics.setLineJoin("miter")
	s:fill(width,height,fulls)
	create_list()
	initialize_input()
	create_camera()

	-- loads the font object, sets the line join type, and creates the global list, keyboard/mouse input, and camera objects.
	math.randomseed(os.time())
	math.random();math.random();math.random();
	-- initializes the random seed of math.random(). From now on, you can just call math.random() and get a unique, random number!
end

--[[
	Welcome to the initializer function! This function just sets up the game window, sets up the keyboard/mouse objects, camera, and global lists

	it has 3 input arguments:

	1). Fulls
		-- Can be either "fullscreen" or "windowed". Determines if the game window should be fullscreen or not.
	2). width
		--If not in fullscreen mode, then the width of the window.
	3). height
		--If not in fullscreen mode, then the height of the window.

	Example:
		initializer("windowed",800,600)

		This makes the game window and 800px by 600px rectangle.
]]--