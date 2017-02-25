# Add items to menu - done
# Remove items from menu - done
# Set prices - done
# Receives final order
# Confirms order received by text
require_relative 'menu'

class Restaurant

  def initialize(menu = Menu.new)
    @menu = menu
    @items = {}
  end

  def create(dish, price)
    @item = {dish => price}
  end

  def add_to_menu
    dish = @item
    @menu.add(dish)
  end

  def remove(dish)
    @menu.remove(dish)
  end
end
