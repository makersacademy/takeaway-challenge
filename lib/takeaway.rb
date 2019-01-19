require_relative 'menu'

class Takeaway

  attr_reader :menu, :new_order_list

  def initialize(menu = Menu.new)
    @menu = menu
    @new_order_list = Array.new
  end

  def show_menu
    return @menu.to_string
  end

  def place_order(quantity, dish_wanted)
    @new_order_list.push({ quantity => dish_wanted })
  end
end

# takeaway = Takeaway.new
# takeaway.menu.add("Dough Balls", 4.49)
# takeaway.menu.add("Cheeseburger", 6.79)
# takeaway.menu.add("Garlic Pizza Bread", 3.99)
# takeaway.menu.add("Chicken Wings", 5.99)
# takeaway.menu.add("Pizza Margherita", 8.99)
# p takeaway.show_menu
