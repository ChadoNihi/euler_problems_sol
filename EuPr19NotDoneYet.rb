CumDaysY = [ 1, 32, 60, 91, 121, 152, 182, 213, 244, 305, 335 ]

def fst_sundays(sy=1901, ey=2000)
	count = 0
	(sy..ey).each do |y|
		count += fst_sundays_in(y, daysBeforeFirstSun)
	end
end

def fst_sundays_in(y, daysBeforeFirstSun)
	days = is_leap(y) ? 366 : 365
	hits = 0

end

def is_leap(y)
	y%4==0 and (y%100!=0 or y%400==0)
end