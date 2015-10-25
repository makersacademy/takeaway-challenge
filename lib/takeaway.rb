require_relative 'order'
require_relative 'twilio_txt'

class Takeaway
  attr_reader :number, :order

  def initialize(num = 'no_num',
                 order_klass = Order.new,
                 txt_klass = Sms.new)
    @number = num
    @order = order_klass
    @txt = txt_klass
  end


  def add(food, quantity=1)
    raise ArgumentError, "try again" if !@order.menu.has_key?(food.to_sym)
    @order.add_to(food, quantity)
    current_order
  end

  def current_order
    "Current order: #{get_order}, Current total: #{get_total}"
  end

  def checkout
    message = current_order.gsub!(/Current/, 'Final')
    @txt.call(@num, message)
  end

  private

  def get_order
    @order.order_log
  end

  def get_total
    @order.total
  end
end
