require_relative 'menu'

class Order
  def add_dish(menu, dish, quantity)
    if menu.dish_list.include?(dish)
    "You have ordered #{quantity} #{dish}"
  else
    raise "Error you must select an item on the menu"
    end

  end

end
