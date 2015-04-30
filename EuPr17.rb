class EuPr17
	@inWords={1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six",  7=>"seven",
			8=>"eight",  9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve",  13=>"thirteen",
			15=>"fifteen",  18=>"eighteen",  20=>"twenty", 30=>"thirty", 40=>"forty",
			50=>"fifty", 80=>"eighty"}

    def initialize(to=1000)
		@to=to
	end

	def count_all_letters()
		if @to == 0
			4
		else
			(1..@to).reduce(0) {|sum, x| sum + in_words(x).length}
		end
	end

	def self.inWords
		@inWords
	end

	private

	def in_words(x)
		if EuPr17.inWords.keys.include?(x)
			EuPr17.inWords[x]
		elsif x<20
			EuPr17.inWords[x%10]+"teen"
		elsif x<100
			lastDig = x%10
			lastDig==0 ? EuPr17.inWords[x/10]+"ty" : in_words(x/10*10)+in_words(lastDig)
		else
			thousands = x/1000
			case thousands
			when 0
				fstDig = x/100
				x%100==0 ? in_words(fstDig)+"hundred" : in_words(fstDig)+"hundredand"+in_words(x-fstDig*100)
			when 1...1000
				process_above(x, 1000, "thousand")
			when 1000...1_000_000
				process_above(x, 1_000_000, "million")
			end
					
		end
	end

	def process_above(x, n, word)
		fstDigs = x/n
		x%n==0 ? in_words(fstDigs)+word : in_words(fstDigs)+word+in_words(x-fstDigs*n)
	end
end