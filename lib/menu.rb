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

	def get_selection 
		puts "Please enter the number of the item you wish to order, enter ""done"" when finished."
		selection = gets.chomp
		while selection != "done" do
			@available_dishes.each_with_index do |dish, index|
				if (selection.to_i - 1) == index
					@cart << dish
				end
			end
			selection = gets.chomp
		end
	end

	def checkout
		total = 0
		@cart.each do |dish|
			total += dish.price
		end
		puts "Your order comes to a total of £#{total}"
		text = Text.new.send_message(total)
	end
end