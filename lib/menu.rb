module Menu

	attr_reader :menu_list

	def initialize
		@menu_list = {"Burger supreme" => 15, "Chicken wrap" => 8, "Chorizo and eggs" => 7, "Salmon sushi x6" => 10, "Gin and tonic" => 5, "Homemade beer" => 3}
	end

	def menu
		@menu_list
	end

	def food_item
		menu.keys
	end

	def item_price
		menu.keys
	end
	
end