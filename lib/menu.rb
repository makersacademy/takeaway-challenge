class Menu
	attr_accessor :available_dishes, :cart

	def initialize
		@available_dishes = []
		@cart = []
	end

	def add_dish(dish)
		@available_dishes << dish
	end

	def show_menu
		@available_dishes.each_with_index do |dish, index|
			puts "#{index + 1}.#{dish.name} - #{dish.price}"
		end
	end

	def get_selection(stdin: $stdin)
		puts "Please enter the number of the item you wish to order"
		selection = stdin.gets
		@available_dishes.each_with_index do |dish, index|
			if (selection - 1) == index
				cart << dish
			end
		end
	end
end