module DishList

	def dishes
		@dishes ||= []
	end

	def list_count
		@dishes.count
	end

	def add_dish(dish)
		@dishes << dish
	end

	def select_dish(dish)
		@dishes.select{|item| item == dish}.first
	end


end