class Takeaway

  require_relative 'menu'
  require_relative 'order'
  require_relative 'sms'

  attr_reader :order

  def initialize(order = nil)
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
    fail "Order empty - no breakdown to display" unless @order
    @order.breakdown
    puts "The order total is £#{@order.total}"
  end

  def confirm(mobile)
    fail "Order empty" unless @order
    SMS.new(mobile).send_sms
    @order = nil
  end

end
