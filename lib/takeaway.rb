class Takeaway

  require_relative './menu'
  require_relative './order'
  require_relative './sms'

  attr_reader :order

  def initialize
    @menu = Menu.new
  end

  def menu
    @menu.print
  end

  def new_order(*numbers)
    @order = Order.new(numbers)
    puts "The order total is £#{'%.02f' % @order.total}"
  end

  def breakdown
    @order.breakdown
    puts "The order total is £#{'%.02f' % @order.total}"
  end

  def confirm(mobile)
    SMS.new(mobile)
  end

end
