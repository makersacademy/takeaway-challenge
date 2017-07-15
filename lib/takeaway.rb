class Takeaway

  require_relative './menu'
  require_relative './order'

  attr_reader :order

  def initialize
    @menu = Menu.new
  end

  def menu
    @menu.print
  end

  def new_order(*numbers)
    @order = Order.new(numbers)
    "The order total is £#{'%.02f' % @order.total}"
  end

  def breakdown
    @order.breakdown
    "The order total is £#{'%.02f' % @order.total}"    
  end

end
