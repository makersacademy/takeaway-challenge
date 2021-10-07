require_relative 'order'
require_relative 'sms'

module Menu
  def print_menu(dishes)
    puts dishes.map { |dish| format(dish) }.join("\n\n")
  end
end
# following SRP

class Takeaway
  attr_reader :current_order
  include Menu
  
  @@sms_client = SMS.new

  def initialize(dishes, order_class: Order)
    dishes = [dishes] unless dishes.is_a? Array # can pass in 1 or more dishes
    @dishes = dishes
    @order_class = order_class
  end

  def dishes
    @dishes.dup
  end

  def menu
    print_menu(dishes)
  end

  def select_dish(dish, quantity = 1)
    dish_check(dish)
    @current_order ||= @order_class.new
    quantity.times { @current_order.add(dish) }
  end

  def remove_dish(dish)
    @current_order.remove(dish)
  end
  
  def reset_order
    @current_order.clear_basket
  end

  def sms_client
    @@sms_client
  end

  def confirm_order
    order_check
    @@sms_client.text(order_summary)
    @current_order = nil
  end

  private

  def format(dish)
    "Dish: #{dish.name}\nPrice: £#{dish.price}"
  end

  def order_summary
    "Thank you! Your order ##{@current_order.id} totalling £#{@current_order.total} "\
    "has been placed and will be delivered by #{@current_order.delivery_time}."
  end

  def dish_check(dish)
    raise "Please select a dish from this takeaway." unless @dishes.include?(dish)
  end

  def order_check
    raise "Please make an order first" if @current_order.nil?
  end
end
