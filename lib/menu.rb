class Menu

	attr_reader :menu_list

	def initialize
		@menu = {"Burger supreme" => 15, "Chicken wrap" => 8, "Chorizo and eggs" => 7, "Salmon sushi x6" => 10, "Gin and tonic" => 5, "Homemade beer" => 3}
	end

	def menu_list
		@menu
	end
	
end