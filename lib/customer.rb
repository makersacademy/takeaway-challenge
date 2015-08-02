require_relative 'menu'

class Customer

	def show_pizzas(menu_class)
		@pizzas_menu = menu_class.pizzas
		@pizzas_menu
	end

	def show_drinks(menu_class)
		@drinks_menu = menu_class.drinks
		@drinks_menu
	end
end