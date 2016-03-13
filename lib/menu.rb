

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
	
end
