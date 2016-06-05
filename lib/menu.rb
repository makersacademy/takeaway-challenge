#it understands the showing of items on a menu

class Menu

	def initialize
		@food_list = { 
			chicken_korma: 4.50, 
			lamb_madras: 5.00,
			prawn_jalfrezi: 6.00,
			keema_naan: 2.00,
			poppadum: 0.50,
			dodgy_omlette: 3.00
		}
	end

	def show_menu
		@food_list.dup
	end

end