function printer(input_text,input_x,input_y,justification,thrustification,input_color)

	local text = input_text
	local just = 0
	local thrust = 0

	if justification == "right" then
		just = -font:getWidth(text)
	elseif justification == "left" then
		just = 0
	elseif justification == "center" then
		just = -font:getWidth(text)/2
	end

	if thrustification == "bottom" then
		thrust = font:getHeight(text)
	elseif thrustification == "top" then
		thrust = 0
	elseif thrustification == "center" then
		thrust = font:getHeight(text)/2
	end
	local x = input_x + camera.pos.x + just
	local y = s.h - input_y - camera.pos.y + thrust

	local color = input_color

	love.graphics.setColor(color)
	love.graphics.print(text,x,y)

end

--[[
	Welcome to the printer function!
	Use this function to print text on the screen.

	It has 6 arguments:
		1). input_text
			-- This is the text you want to print. (YOU CANNOT PRINT BOOLEANS i.e. true/false)
		2). input_x
			-- the x-coordinate of the text's position
		3). input_y
			-- the y-coordinate of the text's position
		4). justification
			-- This can be either "right", "left", or "center".
		5). thrustification
			-- This can be either "top", "bottom", or "center". This determines if the text should be drawn above the x,y point, or below it.
		6). input_color
			-- A table value. {red,green,blue}. The color of the printed text.
	Example:
		printer("Hello World :)!",500,300,"center","center",{1,0,0})

		This will print "Hello World :)!" at 500x 300y centered along the x and y components, in the color {1,0,0} (red)
--]]
