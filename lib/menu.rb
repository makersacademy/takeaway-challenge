class Menu
	attr_reader :available_dishes

	def initialize(dishes)
		@available_dishes = []
		@available_dishes << dishes
	end

	def show_menu
		@available_dishes
	end
end