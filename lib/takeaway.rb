require_relative 'menu'

class Takeaway
  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def menu
    @menu.list
  end

  def place_order
    p "What would you like to order? (type DONE to finish)"
  end

  def check_order
    @order.print_out
  end

end