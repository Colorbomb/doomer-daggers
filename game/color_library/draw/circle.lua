function circle(input_mode,input_x,input_y,input_radius,input_color)
	local mode = input_mode
	local x = input_x + camera.pos.x
	local y = s.h - input_y - camera.pos.y

	if input_x == "table" then
		x = input_x.x - camera.pos.x
		y = s.y - input_x.y - camera.pos.y
	end
	local size = input_radius
	local color = input_color
	local subs = 32*(math.abs(size)/25)
	if subs > 32 then 
		subs = 32
	end
	if subs < 3 then 
		subs = 3
	end
	love.graphics.setColor(color)
	love.graphics.circle(mode,x,y,size,subs)
end
function true_circle(input_mode,input_x,input_y,input_radius,input_color)
	local mode = input_mode
	local x = input_x + camera.pos.x
	local y = s.h - input_y - camera.pos.y

	if input_x == "table" then
		x = input_x.x - camera.pos.x
		y = s.y - input_x.y - camera.pos.y
	end
	local size = input_radius
	local color = input_color
	local subs = 32
	love.graphics.setColor(color)
	love.graphics.circle(mode,x,y,size,subs)
end
--[[
	Welcome to the circle function! Use this function to draw circles on the screen.

	It has 5 input arguments:
		1). input_mode
			-- Can be either "fill", or "line". Determines if the circle should be drawn as a solid shape, or as an outline.
		2). input_x
			-- The x-coordinate of the circle.
		3). input_y
			-- The y-coordinate of the circle.
		4). input_radius
			-- The radius of the circle.
		5). input_color
			-- A table value. {red,green,blue}. The color to draw the circle.

		Example:
			circle("line",)
	
		NOTE: To save processing time, the number of subdivisions of the circle will be reduced for small circles.
		If you want to have a circle that is not reduced in quality, use true_circle().
]]--