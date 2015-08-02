class Menu

attr_accessor :menu_name, :menu_items, :add_item_to_menu

DEFAULT_MENU_NAME = "Ben's Menu"
DEFAULT_MENU = {"Dosa" => 4,"Badam Drink" => 3,"Bisebele Bhath" => 2,"Water" => 1}

	def initialize
		@menu_name = DEFAULT_MENU_NAME
		@menu_items = DEFAULT_MENU
	end

	def add_item_to_menu (item, price)
		menu_items[item] = price
	end

end



