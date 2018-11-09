class Menu
	attr_reader :available_dishes

	def initialize
		@available_dishes = []
	end

	def add_dish(dish)
		@available_dishes << dish
	end

	def show_menu
		@available_dishes.each do |dish|
			puts "#{dish.name} - #{dish.price}"
		end
	end
end