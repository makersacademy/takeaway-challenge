
require_relative 'menu'
require_relative 'order'
require_relative 'order_log'
require_relative 'twilio'

class Takeout

  attr_reader :menu, :my_order, :private_data, :order_log

  def initialize(foodfile = 'ratties_picnic.csv')
    @menu = Menu.new(foodfile).dishes
    @order_log = OrderLog.new
    @private_data = PrivateData.new
    @my_order = Order.new
  end

  def order(key)
    my_order.add_dish(menu[key])
  end

  def total
    my_order.total
  end

  def basket
    my_order.dishes
  end

  def pay(sum)
    raise 'Nothing ordered yet!' if my_order.dishes.empty?
    raise 'Wrong amount.' if sum.to_f != my_order.total
    private_data.send_text('Payment successful.  Your order should be with you soon.')
    puts 'Order received!'
    complete_order
  end

  private

  attr_writer :my_order

  def complete_order
    order_log.record_order(my_order)
    my_order.reset
  end

end
