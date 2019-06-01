function sortdrawlist() -- this function just sorts the drawlist from biggest to smallest layer. (we want to draw the things on a larger layer first)

	table.sort(list.draw, 
		function(a,b)
			return a.layer > b.layer
		end)

end