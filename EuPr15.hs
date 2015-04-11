{-Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?-}

noBacktrackingRoutesInSqGrid::Integer->Integer
noBacktrackingRoutesInSqGrid n = div (fctrl (numOfSteps-n+1) numOfSteps) $ fctrl 2 n --using combinatorics
	where
		numOfSteps = n*2
		fctrl st end
			| end == 0 || end == 1 = 1
			| otherwise = if st==end then end else st * (fctrl (st+1) end)