nonAbSum::Integer
nonAbSum = sum [1,3..fstExpressibleOdd-2]
	+ sum [2,4..fstExpressible-2]
	+ sum $ filter (not isExpressed) [fstExpressible+2, fstExpressible+4..fstExpressibleOdd]
	+ sum $ filter (not isExpressed) [fstExpressibleOdd+1..28123]
	where
		fstExpressible = fstAbEven*2
		fstExpressibleOdd = fstAbOdd + fstAbEven
		fstAbOdd = head $ filter odd $ genAbundant 1000
		fstAbEven = 12

isExpressed::Integer -> Bool
isExpressed x = any (==x) [a+b | a <- genAbundant , b <- genAbundant ]

genAbundant::Integer -> [Integer]
genAbundant to = filter isAbundant [1..to]
	where
		isAbundant x = (sum $ findDevisors x) > x
		findDevisors x = 1 : (if even x
			then filter (\d -> mod x d == 0) [2..div x 2]
			else filter (\d -> mod x d == 0) [3, 5..div x 3])