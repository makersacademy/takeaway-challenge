require_relative 'menu'
require_relative 'basket'

class Takeaway

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def show_menu
    @menu.display_menu
  end

  def add_to_order(item, quantity)
    item = item.downcase
    raise "Item not on menu!" if on_menu?(item.to_sym) == false

    @basket.set_basket(item.to_sym, quantity)
  end

  private 

  def on_menu?(item)
    @menu.menu.has_key?(item)
  end
end
