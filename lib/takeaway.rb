require_relative 'food_menu.rb'
require_relative 'order_management.rb'
require_relative 'twilio_message.rb'

class Takeaway

  attr_reader :food_menu, :order_management, :message

  def initialize(food_menu, order_management = OrderManagement.new, message = Message.new)
    @food_menu = food_menu
    @order_management = order_management
    @message = message
  end

  def see_dishes
    food_menu.print
  end

  def place_the_order(selected_dishes)
    selected_dishes.each do |dish, number|
      order_management.add_to_order(dish, number)
    end
    order_management.sum_total
    message.deliver_message
  end

end
