class Menu

	attr_accessor :menu_items, :add_item_to_menu

	def initialize
		@menu_items = {}
	end

	def add_item_to_menu (item, price)
		menu_items[item] = price
	end

end


class BenMenu < Menu

	attr_accessor :menu_name, :menu_items

	def initialize
		@menu_name = "Ben's Menu"
		@menu_items = {"Dosa" => 4,"Badam Drink" => 3,
			"Bisebele Bhath" => 2,"Water" => 1}
	end

end

