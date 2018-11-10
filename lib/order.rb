require_relative "menu"

class Order

	def initilize(menu = Menu)
		
	end

	def add_order(dish, amount)
		return "No such dish" if !dish.on_menu?(dish)
		"soemthing"
	end



end