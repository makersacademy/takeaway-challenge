class Menu


	def initialize
		@dish_list = {}
		
		dish1 = Dish.new("Water", 1)
		dish2 = Dish.new("Cheese Sandwich", 1)
		dish3 = Dish.new("Chicken Sandwich", 3)
		dish4 = Dish.new("Tuna Sandwich", 2)
		dish5 = Dish.new("Egg Sandwich", 2)
		
		@dish_list.store(dish1.name, dish1)
		@dish_list.store(dish2.name, dish2)
		@dish_list.store(dish3.name, dish3)
		@dish_list.store(dish4.name, dish4)
		@dish_list.store(dish5.name, dish5)		
	end

	def dish(name)
		@dish_list[name]
	end

end