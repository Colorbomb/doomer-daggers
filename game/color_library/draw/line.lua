function line(input_x1,input_y1,input_x2,input_y2,Thickness,input_color)
	local x1 = input_x1
	local y1 = s.h - input_y1
	local x2 = input_x2
	local y2 = s.h - input_y2
	local color = input_color
	love.graphics.setLineWidth(Thickness)	
	love.graphics.setColor(color)
	love.graphics.line(x1,y1,x2,y2)
	love.graphics.setLineWidth(1)	
end
--[[
	Welcome to the line function! Use this function to draw lines on the screen.

	a line has 2 points, the start point and the end point.

	It has 5 input arguments:
		1). input_x1
			-- The x-coordinate of the first point
		2). input_y1
			-- The y-coordinate of the first point
		3). input_x2
			-- The x-coordinate of the second point
		4). input_y2
			-- The y-coordinate of the second point
		5). Thickness
			-- The thickness of the line.
		5). input_color
			-- A table value. {red,green,blue}. The color to draw the line.
		Example:
			line(10,40,60,70,5,{0,0,1})
			
			This draws a line from 10x, 40y, to 60x, 70y, with a thickness of 5 in the color blue.
]]--