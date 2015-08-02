
class Menu

	attr_reader :food

	def initialize
		@food = {'salmon sashimi' => 4.00, 
							'tempura handroll' => 3.50,
							'agedashi tofu' => 2.00,
							'spicy tuna maki' => 3.00,
							'spicy beef donburi' => 7.00}
	end
	
end