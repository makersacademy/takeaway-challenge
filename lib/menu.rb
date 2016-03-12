require_relative 'dish'

class Menu


	def initialize
		@menu_list = Hash.new
	end

	def add_dish(item, price)
		@menu_list[item] = price
	end

	def delete_dish(item)
		@menu_list.delete(item)
	end

	def menu_list
		@menu_list.dup
	end

	def find(this_dish)
		@menu_list[this_dish]
	end

	# def find_on_order(this_dish)
	# 	@my_order.select { |my_dish| my_dish.item == this_dish }
	# end

end
# [dish_class.new("pizza", 10), 
# 				dish_class.new("pasta", 9),
# 				dish_class.new("garlice bread", 4),
# 				dish_class.new("side salad", 10),]