sumPrimes:: Int -> Int
sumPrimes below = sum (filter (isPrime) $ takeWhile (< below) $ [3,5..])+2
	where isPrime x = all (/=0) [mod x y | y <- [3,5..div x 3]]