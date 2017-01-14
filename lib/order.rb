class Order

attr_accessor :items

	def initialize(items = [])
	@items = items
	end

	def price
		sum = 0
		@items.map do |hash|
		hash.each do |key,value|
		sum+= value
		end
		end
		return sum
	end

end