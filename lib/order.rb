require_relative 'sms'

class Order
  attr_reader :current_order, :order_total

  def initialize(sms_klass = Sms.new)
    @sms = sms_klass
    @current_order = []
    @order_total = 0
    @order_log = []
  end

  def set_current_order(dish, quantity, price)
    @current_order << {dish: dish, quantity: quantity, price: price}
    @order_total += @current_order.last[:price]
  end

  def sum_up_prices
    current_order.map {|order| order[:price]}.reduce(:+)
  end

  def assign_order_number
    @order_number = rand(5000)
  end

  def wrong_total?
    !!(sum_up_prices != order_total)
  end

  def send_sms
    @sms.send(@order_number)
    order_logging
  end

  private

  def order_logging
    order = %(Order: #{@current_order}
    Order Number: #{@order_number} Order Amount: #{@order_total})
    @order_log << order
    @current_order.clear
    @order_total = 0
  end

end
