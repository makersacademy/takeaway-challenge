
require_relative 'menu'
require_relative 'order'
require_relative 'order_log'
require 'twilio-ruby'
require_relative 'twilio'

class Takeout

  attr_reader :menu, :my_order, :previous_orders, :private_data

  def initialize(foodfile = 'ratties_picnic.csv')
    @menu = Menu.new(foodfile)
    @previous_orders = {}
    @order_log = OrderLog.new
    @private_data = PrivateData.new
  end

  def order(key)
    @my_order = Order.new if my_order == nil
    my_order.add_dish(menu.dishes[key])
  end

  def total
    my_order == nil ? 0 : my_order.total
  end

  def list_of_dishes
    my_order.dishes
  end

  def pay(sum)
    raise 'Wrong amount.' if sum.to_f != my_order.total
    private_data.send_text('Payment successful.  Your order should be with you soon.')
    puts 'Order received!  You should receive a confirmation text shortly.'
    previous_orders[Time.now] = my_order
    self.my_order = nil
  end

  private

  attr_writer :my_order

end
