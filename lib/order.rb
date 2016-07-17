require_relative 'menu'

class Order
private
	attr_reader :menu, :basket
public

	def initialize menu:
		@menu = menu
		@basket = Hash.new(0)
	end

	def read_menu
		menu.list_dishes
	end

	def select_dish dish_name, quantity
		dish = menu.list_dishes.find{ |dish| dish.get_name == dish_name }
		basket[dish] += quantity
		puts "You ordered #{quantity}x #{dish_name}"
	end

	def basket_summary
		basket
	end

end