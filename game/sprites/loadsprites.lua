function loadsprite(spritename)
if spritename == "enemy" then
		local sprite = {
			img = love.graphics.newImage("sprites/phi_idle.png"),
			animations = {
				idle = 	{
					name = "idle",
					numframes = 1,
					w = 908,
					h = 839,
					img = love.graphics.newImage("sprites/phi_idle.png"),
					quads = loadquads(908,839,love.graphics.newImage("sprites/phi_idle.png"),1),
					frame = 1,
					iterator = 1,
					rate = 10,
					
					anim = function(self,x,y,z,r,sx,sy,speed)
						
						if speed ~= 0 then
							speed = speed/2
							self.rate = speed
							self.iterator = self.iterator + 1
							if self.iterator >= self.rate then
								self.frame = self.frame + math.ceil(self.iterator-self.rate)
								self.iterator = 1						
							end
							if self.frame > #self.quads then
								self.frame = 1
							end
							sprite3D(self.img,self.quads[self.frame],x,y,z,sx,r,self.w,self.h)
						else
							sprite3D(self.img,self.quads[self.frame],x,y,z,sx,r,self.w,self.h)
							self.iterator = 1
						end
					end,
				},
				walk = 	{
					name = "walk",
					numframes = 2,
					w = 400,
					h = 900,
					img = love.graphics.newImage("sprites/enemywalk/spritesheettest.png"),
					quads = loadquads(400,900,love.graphics.newImage("sprites/enemywalk/spritesheettest.png"),2),
					frame = 1,
					iterator = 1,
					rate = 10,
					
					anim = function(self,x,y,z,r,sx,sy,speed)
						
						if speed ~= 0 then
							self.rate = speed
							self.iterator = self.iterator + 1
							if self.iterator >= self.rate then
								self.frame = self.frame + 1-- + math.ceil(self.iterator-self.rate)
								self.iterator = 1						
							end
							if self.frame > #self.quads then
								self.frame = 1
							end
							sprite3D(self.img,self.quads[self.frame],x,y,z,sx,r,self.w,self.h)
							--printer3D(self.frame,x,y,z)
						else
							sprite3D(self.img,self.quads[self.frame],x,y,z,sx,r,self.w,self.h)
							self.iterator = 1
						end
					end,
				}	
		}
	}
	return sprite

end
end


function loadquads(w,h,sprite,numframes)
	local size
	local numrows = 1
	local quads = {}

	numrows = math.floor(numframes/5)
	if numrows == 0 then
		numrows = 1
	end
	for j = 1, numrows do
		if j < numrows then
			for i = 1, 5 do
				quads[i+(j-1)*5] = love.graphics.newQuad((i-1)*w,(j-1)*h,w,h,sprite:getDimensions())
				--print(i+(j-1)*3)
			end
		else
			for i = 1, numframes%5 do
				quads[i+(j-1)*5] = love.graphics.newQuad((i-1)*w,(j-1)*h,w,h,sprite:getDimensions())
				--print(i+(j-1)*3)
			end
		end				
	end

	return quads
end