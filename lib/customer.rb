class Customer

attr_reader :dish_list

	def initialize(dish_list = [])
		@dish_list = dish_list
	end
end