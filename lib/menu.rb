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

	def find_price_of(dish)
		@menu_list[dish]
	end

	def find(dish)
		@menu_list.include?(dish)
	end

end
