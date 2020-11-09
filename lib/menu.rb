class Menu
attr_reader :menu
MENU = {"Burger" => 5, "Fries" => 3, "Drink" => 2}

def initialize(menu= MENU)
  @menu = menu
end

def view_menu
  puts "----------MENU----------"
  @menu.each { |item, price| puts "Item: #{item}, Price: £#{price}"}
  puts "------------------------"
end

def item_available?(dish_name)
  if @menu.has_key?(dish_name)
    return dish_name
  else
    raise "Error - don't think we have that. Have you checked your spelling?"
  end
end
end
