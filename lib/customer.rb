class Customer

	def initialize
		@phone_number = "+447759190557"
		@selection = []
	end

	def phone_number
		@phone_number
	end

	def selection
		@selection
	end

	def select_food(dish)
	selection << dish
	end

end