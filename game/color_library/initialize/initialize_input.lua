function initialize_input()
	mouse = {
		pos = {x = 0, y = 0},
		vel = {x = 0, y = 0},
		button1 = {pulse = 0, down = 0},
		button2 = {pulse = 0, down = 0},
		button3 = {pulse = 0, down = 0},
		anybutton = {puslse = 0, down = 0},

		update = function(self)
			self:unpulse()
			local prevx = self.pos.x
			local prevy = self.pos.y
			self.pos.x = love.mouse.getX() - camera.pos.x
			self.pos.y = s.h - love.mouse.getY() - camera.pos.y
			self.vel.x = self.pos.x - prevx
			self.vel.y = self.pos.y - prevy

			if love.mouse.isDown(1) then
				if self.button1.down == 0 then
					self.button1.pulse = 1
				end

				self.button1.down = 1
			else
				self.button1.down = 0
			end
			if love.mouse.isDown(2) then
				if self.button2.down == 0 then
					self.button2.pulse = 1
				end

				self.button2.down = 1
			else
				self.button2.down = 0
			end
			if love.mouse.isDown(3) then
				if self.button3.down == 0 then
					self.button3.pulse = 1
				end

				self.button3.down = 1
			else
				self.button3.down = 0
			end
			if self.button1.pulse == 1 or self.button2.pulse == 1 or self.button3.pulse == 1 then
				self.anybutton.pulse = 1
			end
			if self.button1.down == 1 or self.button2.down == 1 or self.button3.down == 1 then
				self.anybutton.down = 1
			end
		end,

		unpulse = function(self)
			self.button1.pulse = 0
			self.button2.pulse = 0
			self.button3.pulse = 0
			self.anybutton.pulse = 0
		end
	}

	keyboard = {
		btns = {
			a = {pulse = 0, down = 0, key = "a"},
			b = {pulse = 0, down = 0, key = "b"},
			c = {pulse = 0, down = 0, key = "c"},
			d = {pulse = 0, down = 0, key = "d"},
			e = {pulse = 0, down = 0, key = "e"},
			f = {pulse = 0, down = 0, key = "f"},
			g = {pulse = 0, down = 0, key = "g"},
			h = {pulse = 0, down = 0, key = "h"},
			i = {pulse = 0, down = 0, key = "i"},
			j = {pulse = 0, down = 0, key = "j"},
			k = {pulse = 0, down = 0, key = "k"},
			l = {pulse = 0, down = 0, key = "l"},
			m = {pulse = 0, down = 0, key = "m"},
			n = {pulse = 0, down = 0, key = "n"},
			o = {pulse = 0, down = 0, key = "o"},
			p = {pulse = 0, down = 0, key = "p"},
			q = {pulse = 0, down = 0, key = "q"},
			r = {pulse = 0, down = 0, key = "r"},
			s = {pulse = 0, down = 0, key = "s"},
			t = {pulse = 0, down = 0, key = "t"},
			u = {pulse = 0, down = 0, key = "u"},
			v = {pulse = 0, down = 0, key = "v"},
			w = {pulse = 0, down = 0, key = "w"},
			x = {pulse = 0, down = 0, key = "x"},
			y = {pulse = 0, down = 0, key = "y"},
			z = {pulse = 0, down = 0, key = "z"},
			space = {pulse = 0, down = 0, key = "space"},
			enter = {pulse = 0, down = 0, key = "return"},
			lshift = {pulse = 0, down = 0, key = "lshift"},
			rshift = {pulse = 0, down = 0, key = "rshift"},
			lctrl = {pulse = 0, down = 0, key = "lctrl"},
			rctrl = {pulse = 0, down = 0, key = "rctrl"},
			lalt = {pulse = 0, down = 0, key = "lalt"},
			ralt = {pulse = 0, down = 0, key = "ralt"},	
			backspace = {pulse = 0, down = 0, key = "backspace"},
			escape = {pulse = 0, down = 0, key = "escape"},
			up = {pulse = 0, down = 0, key = "up"},
			down = {pulse = 0, down = 0, key = "down"},
			left = {pulse = 0, down = 0, key = "left"},
			right = {pulse = 0, down = 0, key = "right"},
			},
		update = function(self)
			self:unpulse()
			for k,v in pairs(self.btns) do
				if love.keyboard.isDown(v.key) then
					if v.down == 0 then
						v.pulse = 1
					end
					v.down = 1
				else
					v.down = 0
				end
			end
		end,

		unpulse = function(self)
			for k,v in pairs(self.btns) do
				v.pulse = 0
			end
		end
	}

	table.insert(list.update, mouse)
	table.insert(list.update, keyboard)

end

--[[
	
	Welcome to the initialize_input function! This function sets up an intuitive mouse and keyboard input handler.

	It creates the mouse object, and the keyboard object.

	Mouse
		important properties (You'll need to know these!):

		mouse.pos.x = x-position of the mouse
		mouse.pos.y = y-position of the mouse

		mouse.button1 = the left mouse button
		mouse.button2 = the right mouse button
		mouse.button3 = the middle mouse button

		mouse.button(1, 2, or 3).down = whether or not button(1, 2, or 3) is currently pressed. Either 1 or 0.
		mouse.button(1, 2, or 3).pulse = whether or not button(1, 2, or 3) was pressed THIS FRAME. Either 1 or 0.
			--This is used for inputs that only last 1 frame. when the mouse button is pressed, pulse = 1. next frame, pulse will be set back to 0
			--Very useful for actions that only need to happen once when the mouse button is pressed.

	Keyboard
		imporant properties (You'll need to know these!):

		keyboard.btns = a list of all the buttons.

		keyboard.btns.(button name).down = whether or not (button name) is currently pressed. Either 1 or 0.
		keyboard.btns.(button name).pulse = whether or not button(1, 2, or 3) was pressed THIS FRAME. Either 1 or 0.
		keyboard.btns.(button name).key = the name of the button.

		You can take a look at the keyboard object to see what the button names are! (They're pretty intiutive.)
]]--