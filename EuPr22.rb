def calc_score(flname)
	sortedNames = File.read(flname).split('","')
	0.downto(-1) {|i| sortedNames[i].tr!('"',"")}
	sortedNames.sort!

	letters = [*'A'..'Z']
	vals = [*1..letters.length]
	lettersVals = Hash[letters.zip(vals)]

	score = 0
	i = 1
	sortedNames.each do |name|
		sum = 0
		name.each_char {|ch| sum += lettersVals[ch]}
		score += i * sum
		i+=1
	end

	score
end

puts calc_score("p022_names.txt")