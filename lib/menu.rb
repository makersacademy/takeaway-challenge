module Menu
	attr_reader :dishes

	def dishes
		@dishes = {"Classic Burger" => 6.75, 
								"Cheese Burger" => 7.95, 
								"Chicken Burger" => 8.95, 
								"Fries" => 2.95}
	end 

	def price dish
		dishes[dish]
	end 

end 