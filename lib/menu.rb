require_relative 'dish'

class Menu

	def initialize(dish_class=Dish)
		@dish_class = dish_class
		@list = []
	end

	def add_dish(item, price)
		@list << @dish_class.new(item, price)
	end

	def delete_dish(item)
		@list.delete_if{ |dish| dish.item ==item}
	end

	def menu_list
		@list.dup
	end

	def find_on(menu, this_dish)
		menu.select { |dish| dish.item == this_dish }
	end

	# def find_on_order(this_dish)
	# 	@my_order.select { |my_dish| my_dish.item == this_dish }
	# end

end
# [dish_class.new("pizza", 10), 
# 				dish_class.new("pasta", 9),
# 				dish_class.new("garlice bread", 4),
# 				dish_class.new("side salad", 10),]