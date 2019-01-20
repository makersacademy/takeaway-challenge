require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def display
    @menu.display
  end

  def add_to_order(choice)
    @order.add_to_order(choice)
  end

  def basket
    @order.basket
  end

  def total_order
    total = @order.total_order
    print "Your order total is £#{total}"
  end

end
