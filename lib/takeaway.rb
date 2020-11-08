require_relative 'menu'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = {})
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.dishes
  end

  def place_order(dish, quantity = 1)
    @order[dish] = quantity
    return "#{quantity}x #{dish}(s) added to your order"
  end

  def basket_summary
    summary = ""
    @order.each {
      |dish, quantity| summary << "#{dish} x#{quantity} = £#{menu.dishes[dish] * quantity}, "
    }
    summary.chop.chop
  end

  def total
    order_total = 0
    @order.each {
      |dish, quantity| order_total += menu.dishes[dish] * quantity
    }
    return "Total: £#{order_total}"
  end
end
