class Menu


	attr_reader :menu

	MENU = {"Chicken rice" => 5,
					  "Steak frites" => 6,
					  "Red prawn curry" => 7,
					"Burger" => 5}

	def initialize(menu = MENU)
		@menu = menu
	end

	def print
		@menu.each do |item, price|
			p "#{item} £#{price}"
		end
	end 

	def price(item)
		@menu[item]
	end
end 