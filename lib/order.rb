require_relative './takeaway'

class Order < Takeaway

  attr_reader :order_items, :current_total

  def initialize(menu = Menu.new)
    @order_items = []
    @menu_items = menu.menu_items
    @current_total
  end

  def add(dish, amount)
    @order_items << {:item => dish, :amount => amount}
  end

# incomplete method for calculating total of order items
  def check_total?
    order_items.sum
  end
end
