function create_list()

	list = {

		update = {},
		draw = {},

		updateall = function(self)
			for i=1, #self.update do
				if self.update[i].update ~= nil then
					self.update[i]:update()
				end
			end
		end,
		drawall = function(self)
			for i=1, #self.draw do
				if self.draw[i].draw ~= nil then
					self.draw[i]:draw()
				end
			end
		end,
	}

	--[[
		Welcome to the create_list function! This function creates the global update and draw lists
		Every object in the game will be inserted into these 2 lists. 
		If an object has an update function, it is put into the update list.
		If an object has a draw function, it is put into the draw list.
		every frame, all of the objects in the update list are updated, and all of the objects in the draw list are drawn.

		With this list, you can keep your main function clean!


		Important properties (You'll need to know these):
			list.update = the update list
			list.draw = the draw list

			updateall = a function that runs the update function of each element in the update list.
			drawall = a function that runs the draw function of each element in the draw list
	]]--




end