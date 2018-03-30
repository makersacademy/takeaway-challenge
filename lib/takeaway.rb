class Takeaway

	def initialize(menu:)
    	@menu = menu
	end

	def print_menu
		menu.print
	end

 	private

	attr_reader :menu
end

# initaial_menu = { :Hotdog => 2, :Pizza => 4, :Sushi => 5, :Bagel => 3, :Sandwich => 2, :Drink => 1 }
 