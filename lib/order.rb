require 'menu'

class Order

	attr_reader = false


	def initialize (menu_klass = Menu)
		@basket = []
		@paid = false
		@confirmed_order = false
	end

	def show_menu
		Menu.show
	end

	def add_to_basket(dish, quanitity)


	end

	def payment (amount)

	end

	def confirm_order
		raise 'Incorrect amount received. Please enter the correct value'
		if @paid = true
			@confirmed_order = true
	end

	end


private

	def price_of_order
	end

	def check_price_of_order
	end

