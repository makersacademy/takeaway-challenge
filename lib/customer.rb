require_relative 'menu'

class Customer

	attr_reader :pizzas_menu, :drinks_menu, :ordered_pizzas, :ordered_drinks, :pizzas_bill, :drinks_bill

	def initialize
		@pizzas_menu = {}
		@drinks_menu = {}
		@ordered_pizzas = []
		@ordered_drinks = []
		@pizzas_bill = []
		@drinks_bill = []
	end

	def show_pizzas(menu_class)
		@pizzas_menu = menu_class.pizzas
		@pizzas_menu
	end

	def show_drinks(menu_class)
		@drinks_menu = menu_class.drinks
		@drinks_menu
	end

	def pick_pizza(quantity, pizza)
		quantity.times do
			ordered_pizzas << pizza
			pizzas_bill << @pizzas_menu[pizza]
		end
		ordered_pizzas
	end

	def pick_drinks(quantity, drink)
		quantity.times do
			ordered_drinks << drink
			drinks_bill << @drinks_menu[drink]
		end
		ordered_drinks
	end
end