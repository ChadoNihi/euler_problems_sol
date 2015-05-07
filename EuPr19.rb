CumDaysY = [ 1, 32, 60, 91, 121, 152, 182, 213, 244, 305, 335 ]
CumDaysYL = [ 1, 32, 61, 92, 122, 153, 183, 214, 245, 306, 336 ]

def fst_sundays(sy=1901, ey=2000)
	count = 0
	daysBeforeFirstSun = calc_fst_offset(sy)
	(sy..ey).inject(0) do |count, y|
		localCount, daysBeforeFirstSun = fst_sundays_in(y, daysBeforeFirstSun)
		count += localCount
	end
end

def fst_sundays_in(y, daysBeforeFirstSun)
	days = is_leap(y) ? 366 : 365
	date += daysBeforeFirstSun
	while date<337
		if __
			hits+=1
			date+=28
		else
			date+=7
		end
	end
	daysBeforeFirstSunNextY = 
	return [hits, daysBeforeFirstSunNextY]
end

def is_leap(y)
	y%4==0 and (y%100!=0 or y%400==0)
end