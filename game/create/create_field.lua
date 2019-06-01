function create_field(size,ringnum,spokenum)
	field = newobj("field",10)
	field.size = size
	field.ringnum = ringnum
	field.spokenum = spokenum
	field.update = fieldupdate
	field.draw = fielddraw
	field.timer = 0

end


function fieldupdate(o)
	o.timer = o.timer + love.timer.getDelta()
end


function fielddraw(o)
	--[[for i=1, o.ringnum do 
		for j=1, o.spokenum*(2*i/o.ringnum) + 3 do
			circle3D("fill",o.size*(i/o.ringnum)*math.cos(2*math.pi*((j-1)/(o.spokenum*(2*i/o.ringnum) + 3))),o.size*(i/o.ringnum)*math.sin(2*math.pi*((j-1)/(o.spokenum*(2*i/o.ringnum) + 3))),100+30*math.sin((math.pi*i/o.ringnum)+o.timer),1,{1,1,1})
		end
	end]]--
	for i=1, o.ringnum do
		for j=1, o.spokenum do
			circle3D("fill",o.size*(j/o.spokenum)-o.size/2,o.size*(i/o.ringnum)-o.size/2,100,1,{1,1,1})
		end
	end


end
