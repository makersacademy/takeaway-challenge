class Menu

attr_accessor :menu_items, :add_item_to_menu, :show_menu

	def initialize
		@menu_items = {"Dosa" => 4,"Badam Drink" => 3,"Bisebele Bhath" => 2,"Water" => 1}
	end

	def add_item_to_menu (item, price)
		menu_items[item] = price
	end

	def show_menu
  	"Our menu:"
 		menu_items.each { |food, price| puts "#{food}: £#{price}" }
	end

end



