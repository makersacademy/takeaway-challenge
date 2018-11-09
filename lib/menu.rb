class Menu
	attr_reader :available_dishes

	def initialize
		@available_dishes = []
	end

	def add_dish(dish)
		@available_dishes << dish
	end

	def show_menu
		@available_dishes.each_with_index do |dish, index|
			puts "#{index + 1}.#{dish.name} - #{dish.price}"
		end
	end
end