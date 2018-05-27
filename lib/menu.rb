class Menu

	attr_reader :menu

	def initialize(list_of_dishes)
		@menu = list_of_dishes
	end

	def print_items
		@menu
	end

end