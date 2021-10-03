require_relative 'order'
require_relative 'sms'

class Takeaway
  attr_reader :current_order
  @@sms_client = SMS.new

  def initialize(dishes, order_class: Order)
    dishes = [dishes] if !dishes.is_a? Array # can pass in 1 or more dishes
    @dishes = dishes
    @order_class = order_class
  end

  def dishes
    @dishes.dup
  end

  def menu
    puts dishes.map{ |dish| format(dish) }.join("\n\n")
  end

  def format(dish)
    "Dish: #{dish.name}\nPrice: £#{dish.price}"
  end

  def select(dish)
    dish_check(dish)
    @current_order ? @current_order.add(dish) : @current_order = @order_class.new([dish])
  end
  
  def order_summary
    "Thank you! Your order ##{@current_order.id} totalling £#{@current_order.total} "\
    "has been placed and will be delivered by #{@current_order.delivery_time}."
  end

  def confirm_order
    order_check
    @@sms_client.text(order_summary)
    @current_order = nil
  end

  def reset_order
    @current_order.clear_basket if @current_order
  end

  def dish_check(dish)
    raise "Please select a dish from this takeaway." if !@dishes.include?(dish)
  end

  def order_check
    raise "Please make an order first" if @current_order.nil?
  end

  def sms_client
    @@sms_client
  end
end