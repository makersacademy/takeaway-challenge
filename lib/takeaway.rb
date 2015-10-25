require_relative "order"
require_relative "twilio_txt"

class Takeaway
  attr_reader :number, :order

  def initialize(num="no_num", order_klass=Order.new, txt_klass=Sms.new)
    @number = num
    @order = order_klass
    @txt = txt_klass
  end


  def add(food, quantity=1)
    fail ArgumentError, "try again" if check_order(food)
    @order.add_to(food, quantity)
    current_order
  end

  def current_order
    "Current order: #{check_order}, Current total: #{check_total}"
  end

  def checkout
    message = current_order.gsub!(/Current/, "Final")
    @txt.call(@num, message)
  end

  private

  def check_input(food)
    @order.menu.key?(food.to_sym)
  end

  def check_order
    @order.order_log
  end

  def check_total
    @order.total
  end
end
