class Restaurant

attr_accessor :menu_name, :menu_items

def initialize
	@menu_name = "Menu"
	@menu_items = {"Dosa" => 4 ,"Badam Drink" => 3,
			"Bisebele Bhath" => 2 ,"Water" => 1}
end

def add_item_to_menu (item, price)
	@menu_items[item] = price
end

def show_menu
	menu_items.each do |key, value|
    puts "#{key}:#{value}"
end
end


end