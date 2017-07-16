require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def read_menu
    @menu.display_menu
  end

  def order(dish, quantity)
    @order.add(dish, quantity)
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def view_basket
    @order.display_basket
  end
end
