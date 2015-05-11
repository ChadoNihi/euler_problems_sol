factorialDigitSum::Integer -> Integer
factorialDigitSum n
	| n < 0 = error "cannot be negative number"
	| otherwise = sumDigits (factorialWoTrailingZeros n)
		where
			factorialWoTrailingZeros 0 = 1
			factorialWoTrailingZeros x = x * (factorialWoTrailingZeros $ x-1)
			sumDigits x = foldl (\sum ch -> sum + readDigit ch) 0 $ show x

readDigit :: Char -> Integer
readDigit ch = read [ch]