require_relative 'order'
require_relative 'sms'

class Takeaway
  attr_reader :current_order
  @@sms_client = SMS.new

  def initialize(dishes, order_class: Order)
    @dishes = dishes
    @order_class = Order
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

  def order(item)
    @current_order ? @current_order.add(item) : @current_order = @order_class.new([item])
  end
  
  def confirm
    @@sms_client.text("Thank you! Your order has been placed "\
    "and will be delivered by #{@current_order.delivery_time}.")
    @current_order = nil
  end

  def sms_client
    @@sms_client
  end
end