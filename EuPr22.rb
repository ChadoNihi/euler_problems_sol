def calc_score(flname)
	sortedNames = File.read(flname).split('","')
	0.downto(-1) {|i| sortedNames[i].tr!('"',"")}
	sortedNames.sort!


end

puts calc_score("p022_names.txt")