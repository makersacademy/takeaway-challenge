require './lib/order.rb'

MENU = [ 
	{ dish: :bruschetta, quantity: 1, price: 5 },
	{ dish: :pizza_salami, quantity: 1, price: 10 },
	{ dish: :pasta_carbonara, quantity: 1, price: 13 },
	{ dish: :sirloin_steak, quantity: 1, price: 16 },
	{ dish: :tiramisu, quantity: 1, price: 6 }
] # <--- New takeaway menu ~

class Menu

	 attr_accessor :menu

	 def initialize
 		 @menu = MENU
 	end

	 def print_menu
 		 @menu.each_with_index do |item, index|
  			 puts "#{index + 1}. #{item[:dish]} : £#{item[:price]}"
  		end # < --- It prints all the menu with the prices ~
 	end

end
