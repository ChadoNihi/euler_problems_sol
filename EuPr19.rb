CumDaysY = [ 1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335 ]
CumDaysYL = [ 1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336 ]

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
	hits = 0
	while date<337
		if cumDays.include?(date)
			hits+=1
			date+=28
		else
			date+=7
		end
	end
	firstSunAtNextY = 7-(days-date)%7
	[hits, firstSunAtNextY]
end

def calc_init_offset(sy)
	(1900...sy).inject(7) do |offset, y| #init offset is 7 since 1 Jan 1900 was a Monday
		offset = is_leap(y) ? 7-(366-offset)%7 : 7-(365-offset)%7
	end
end

def is_leap(y)
	y%4==0 and (y%100!=0 or y%400==0)
end

puts fst_sundays