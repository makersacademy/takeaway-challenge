require_relative 'menu'
require_relative 'messenger'
require_relative 'order'
require_relative 'dish'
require_relative 'basket'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end; "why not .view the menu"

  def view_menu
    @menu.view 
  end

  def order(dish_index, qty = 1)
    @menu.select(dish_index, qty)
  end

  def confirm_order
    @order.add_to_basket(@menu)
  end

  def view_summary
    @order.view
  end

  def pay(amount)
    @order.pay(amount)
  end
end
