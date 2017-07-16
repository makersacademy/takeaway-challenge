class Takeaway

  require_relative 'menu'
  require_relative 'order'
  require_relative 'sms'

  attr_reader :order

  def initialize(order)
    @menu = Menu.new
    @order = order
  end

  def menu
    @menu.print
  end

  def new_order(*numbers)
    @order = Order.new(numbers)
    puts "The order total is £#{@order.total}"
  end

  def breakdown
    @order.breakdown
    puts "The order total is £#{@order.total}"
  end

  def confirm(mobile)
    SMS.new(mobile).send_sms
  end

end
