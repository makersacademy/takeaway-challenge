class Menu

	attr_reader :menu

	STANDARD_MENU = {'beef' => 6.00, 
					'chicken' => 5.50, 
					'veggie' => 4.00, 
					'dessert' => 3.50}

	def initialize(menu = STANDARD_MENU)
		@menu = menu
	end

	def display_menu
		STANDARD_MENU
	end

end