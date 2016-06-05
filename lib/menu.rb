class Menu

	attr_reader :food_list, :drinks_list

	def initialize 
		@food_list = {"Chicken rice" => 5,
					  "Steak frites" => 6,
					  "Red prawn curry" => 7
					}
		@drinks_list = {"Tea" => 3,
						"Espresso" => 2,
						"Flat White" => 2.5}
	end

	def print_list
		p @food_list
	end 
end 