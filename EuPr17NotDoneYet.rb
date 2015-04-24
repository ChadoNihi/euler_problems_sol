class EuPr17
	@inWords={1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six",  7=>"seven",
			8=>"eight",  9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve",  13=>"thirteen",
			15=>"fifteen",  18=>"eighteen",  20=>"twenty", 30=>"thirty", 40=>"forty",
			50=>"fifty", 80=>"eighty"}

	def initialize(to=1000)
		@to=to
	end

	def count_all_letters(to=1000)
		if to == 0
			4
		else
			(1..to).reduce {|sum, x| sum + in_words(x).length}
		end
	end

	private

	def in_words(x)
		
	end

end