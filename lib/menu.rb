class Menu


	attr_reader :menu

	MENU = {"Chicken rice" => 5,
					  "Steak frites" => 8,
					  "Red prawn curry" => 7,
					"Burger" => 5,
					"Fries" => 2,
					"Spaghetti bolognese" => 6}

	def initialize(menu = MENU)
		@menu = menu
	end

	def print
		@menu.each do |item, price|
			p "#{item} : £#{price}"
		end
	end 

	def price(item)
		@menu[item]
	end

	def has_item?(item)
		raise "#{item.capitalize} is not on the menu!" unless menu.key?(item.capitalize)
		true
	end
	
end	