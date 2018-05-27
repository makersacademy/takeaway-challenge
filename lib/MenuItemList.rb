class MenuItemList

	attr_reader :items

	def initialize(array_of_menu_items)
		@items = array_of_menu_items
	end

	def name(idx)
		items[idx].dish_name
	end

	def price(idx)
		items[idx].dish_price
	end

end