require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    return @menu.to_string
  end

  def place_order(quantity, dish_name, new_order = Hash.new)
    new_order[quantity] = { dish_name => @menu.menu_list[dish_name] }
    return new_order
  end
end

takeaway = Takeaway.new
takeaway.menu.add("Dough Balls", 4.49)
takeaway.menu.add("Cheeseburger", 6.79)
takeaway.menu.add("Garlic Pizza Bread", 3.99)
takeaway.menu.add("Chicken Wings", 5.99)
takeaway.menu.add("Pizza Margherita", 8.99)
