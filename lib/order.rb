class Order

	attr_reader :basket

	def initialize
	 	@basket = []
	 end 

	def add_dish(dish, quantity)
		 quantity.times do
		 	@basket << dish 
		 end
		 @basket
	end

	def total_amount
		total = 0
	 	@basket.each do |dish, quantity|
	 		total += dish.price *quantity
	 	end
	 	total
	end


end