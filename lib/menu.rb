class Menu


	attr_reader :menu

	MENU = {"Salad" => 4,
			"Burger" => 5,
			"Chips" => 3,
			"Soda" => 1}

	def initialize(menu = MENU)
		@menu = menu
	end

	def print
		@menu.each do |item, price|
			p "#{item} : $#{price}"
		end
	end 

	def price(item)
		@menu[item]
	end

	def has_item?(item)
		raise "#{item.capitalize} is not available!" unless menu.key?(item.capitalize)
		true
	end
	
end	