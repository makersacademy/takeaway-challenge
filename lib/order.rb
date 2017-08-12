require "./lib/menu.rb"

class Order

	attr_accessor :menu, :basket, :total

	def initialize(total = 0)
		@menu = Menu.new
		@basket = []
		@total = total
	end

	def add_items(dish, quantity, price)
		@basket << { dish: dish, quantity: quantity, price: price }
	end

	def view_order
		@basket.each_with_index do |item, index|
			puts "#{index + 1}. #{item[:dish]} : £#{item[:price]}"
		end
	end

	def place_order
		raise("The total price is not correct!") if total_price == false
	end

	def total_price(price)
		@total = order.basket.map { |h| h[:price] }.sum
		return true if @total = price
	end
end