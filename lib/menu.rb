MENU = [ 
	{ dish: :bruschetta, price: 4.99 },
	{ dish: :pizza_salami, price: 9.99 },
	{ dish: :pasta_carbonara, price: 12.99 },
	{ dish: :sirloin_steak, price: 15.99 },
	{ dish: :tiramisu, price: 5.99 }
]

class Menu

	attr_accessor :menu

	def initialize
		@menu = MENU
	end

	def print_menu
		@menu.each_with_index do |item, index|
			puts "#{index + 1}. #{item[:dish]} : £#{item[:price]}"
		end
	end

end
