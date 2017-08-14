class Order

	attr_accessor :menu, :basket, :total

	def initialize
		@menu = Menu.new
		@basket = []
		@total = 0
	end

	def add_items(dish, quantity, price)
		@basket << { :dish => dish, :quantity => quantity, :price => price }
		@total += quantity * price # <--- I found a different solution to visulize the total price. ~
	end

	def view_order
		@basket.each_with_index do |item, index|
			puts "#{index + 1}. #{item[:dish]} : £#{item[:price]}"
		end
	end

	def place_order(expected)
		raise("The total price is not correct!") if expected != @total
	end

	# def total_price
	# 	total = @total
	# 	@basket.each do |hash_array|
	# 		hash_array.each do |item|
	# 			subtotal = item[:quantity] * item[:price]
	# 			@total =+ subtotal
	# 		end
	# 	end
	# end <-- I struggled iterating through the array of hashes. ~
end