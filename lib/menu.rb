class Menu

attr_reader :dish_list

	def initialize(dish_list = [])
		@dish_list = dish_list
	end

	def add(dish)
		@dish_list << dish
	end
end