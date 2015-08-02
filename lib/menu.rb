require_relative './dish'

class Menu

	attr_reader :menu, :selection

	def initialize 
		@menu = {}
		@selection = []
	end

	def add_to_menu dish
		@menu[dish.name] = dish.price
	end

	def select_dish dish, quantity
		raise 'This dish does not belong to the menu' unless menu.include?(dish.name)
		select =[]
		v = quantity.to_i
		select << dish.name
		select << dish.price
		select << v
		@selection.push(select)
	end

end