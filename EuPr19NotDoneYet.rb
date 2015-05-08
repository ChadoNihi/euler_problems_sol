CumDaysY = [ 1, 32, 60, 91, 121, 152, 182, 213, 244, 305, 335 ]
CumDaysYL = [ 1, 32, 61, 92, 122, 153, 183, 214, 245, 306, 336 ]

def fst_sundays(sy=1901, ey=2000)
	count = 0
	firstSunAt = calc_init_offset(sy)
	(sy..ey).inject(0) do |count, y|
		localCount, firstSunAt = fst_sundays_in(y, firstSunAt)
		count += localCount
	end
end

def fst_sundays_in(y, firstSunAt)
	days, cumDays = is_leap(y) ? [366, CumDaysYL] : [365, CumDaysY]
	date = firstSunAt
	while date<337
		if cumDays.include?(date)
			hits+=1
			date+=28
		else
			date+=7
		end
	end
	firstSunAtNextY = 7-(days-date)%7
	return [hits, firstSunAtNextY]
end

def calc_init_offset(y)
	(1900...y).inject(7) do |offset, y| #init offset is 7 since 1 Jan 1900 was a Monday
		offset = is_leap(y) ? (offset+366)%7+1 : (offset+365)%7+1
	end
end

def is_leap(y)
	y%4==0 and (y%100!=0 or y%400==0)
end