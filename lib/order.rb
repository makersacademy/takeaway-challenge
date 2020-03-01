require_relative './takeaway'
# inherits methods from the Takeaway class (Order has also been injected to Takeaway)
class Order < Takeaway

  attr_reader :order_items, :current_total

# creates a list of menu items, a list of items on the current order, the current total for all items
  def initialize(menu = Menu.new)
    @order_items = []
    @menu_items = menu.menu_items
    @current_total
  end

# adds a dish to the order items array
  def add(dish, amount)
    @order_items << {:item => dish, :amount => amount}
  end

# incomplete method for calculating total of order items using private method sum (not written yet)
  def check_total?
    order_items.sum
  end
end
