require_relative './lib/menu.rb'
require_relative './lib/messenger.rb'
require_relative './lib/order.rb'
require_relative './lib/dish.rb'
require_relative './lib/basket.rb'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

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
