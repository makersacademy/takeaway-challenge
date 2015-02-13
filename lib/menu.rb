class Menu

	attr_accessor :dishes

	def initialize
		@dishes = []
	end

	def list_count
		@dishes.count
	end

	def add_dish(dish)
		@dishes << dish
	end

end