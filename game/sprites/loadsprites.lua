function loadsprite(spritename)
	if spritename == "enemy" then
		local sprite = {
			animations = {
				idle = loadanim("sprites/enemy/idle",1),
				walk = loadanim("sprites/enemy/walk",2),
				}
			}
		return sprite
	end
end

function loadanim(filepath,numframes)
	local based = love.graphics.newImage(filepath.."/base.png")
	local files = love.filesystem.getDirectoryItems(filepath)
	local spritesheets = {}
	for i=1, #files-1 do
		spritesheets[i] = love.graphics.newImage(filepath.."/ ("..i..").png")
	end
	local width = based:getWidth()
	local height = based:getHeight()
	local quadz = {}
	for i=1, #files-1 do
		quadz[i] = loadquads(width,height,spritesheets[i],numframes)
	end
	--print(width,height,filepath)
	local animation = {
			base = based,
			numframes = numframes,
			numangles = #files-1,
			slicesize = (2*math.pi)/(#files-1),
			w = width,
			h = height,
			imgs = spritesheets,
			quads = quadz,
			frame = 1,
			iterator = 1,
			rate = 10,
			anim = function(self,angle,x,y,z,r,s,speed)
				local viewangle = (math.atan2((camera.pos.y - y),(camera.pos.x - x))%(2*math.pi)-(angle))%(2*math.pi)
				--local viewangle2 = math.atan2((camera.pos.y - y),(camera.pos.x - x))%(2*math.pi) - (camera.angle)%(2*math.pi)
				--viewangle = viewangle
				local diff = (viewangle-self.slicesize/2)
				--if diff < 0 then 
				--	diff = diff + 2*math.pi
				--end

				local k = self.numangles - math.floor(((viewangle-self.slicesize/2)%(2*math.pi))/self.slicesize)
				if k == 0 then k = self.numangles end
				
				--print(k)
				if speed ~= 0 then
					self.rate = speed
					self.iterator = self.iterator + 1
					if self.iterator >= self.rate then
						self.iterator = 1						
					end
					if self.frame > #self.quads then
						self.frame = 1
					end
					sprite3D(self.imgs[k],self.quads[k][self.frame],x,y,z,s,r,self.w,self.h)
					--printer3D(math.deg(viewangle),x,y,z)
				else
					sprite3D(self.imgs[k],self.quads[k][self.frame],x,y,z,s,r,self.w,self.h)
					self.iterator = 1
				end
			end,
		}
		return animation
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