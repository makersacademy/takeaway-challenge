class Menu

	attr_reader :menu_list

	def initialize(menu_list = [])
		@menu_list = menu_list
	end

	def add(dish)
		@menu_list << dish
	end

end