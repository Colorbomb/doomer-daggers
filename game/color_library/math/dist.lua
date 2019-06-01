function dist(x1,y1,x2,y2)
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end
--Simple distance formula

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
--rounding numbers

function tlen(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

--get the number of entries in a table. in my experience, # does not work on tables that have key-value pairs.