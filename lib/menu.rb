require './lib/order.rb'

MENU = [ 
	{ item: 1, dish: :bruschetta, price: 4.99 },
	{ item: 2, dish: :pizza_salami, price: 9.99 },
	{ item: 3, dish: :pasta_carbonara, price: 12.99 },
	{ item: 4 ,dish: :sirloin_steak, price: 15.99 },
	{ item: 5 ,dish: :tiramisu, price: 5.99 }
] # <--- New takeaway menu ~

class Menu

	attr_accessor :menu

	def initialize
		@menu = MENU
	end

	def print_menu
		@menu.each do |item|
			puts "#{item[:item]}. #{item[:dish]} : £#{item[:price]}" # < --- It prints all the menu with the prices ~
		end
	end

end
