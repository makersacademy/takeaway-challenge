require_relative 'order'
require_relative 'menu'
require_relative 'twilio'
require 'date'

class Takeaway

  attr_reader :order, :menu, :order_history

  CONFIRMATION = "Thank you! Your order was placed and will be delivered before "

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
    @order_history = []
    @sms = TextOrder.new
  end

  def show_menu
    @menu.show
  end

  def add_dish(number)
    @order.add_dish(dish_from_number(number))
  end

  def remove_dish(number)
    @order.remove_dish(dish_from_number(number))
  end

  def show_order
    @order.show
  end

  def reset_order
    @order = Order.new
  end

  def confirm_order
    send_text
    finish_order
  end

private

  def finish_order
    @order_history << @order
    reset_order
  end

  def dish_from_number(number)
    @menu.send_dish(number)
  end

  def send_text  
    @sms.send_text(confirmation_message)
  end

  def confirmation_message
    CONFIRMATION + delivery_time
  end

  def delivery_time
    delivery_hour = DateTime.now.strftime("%H").to_i + 1
    delivery_hour.to_s + ":" + DateTime.now.strftime("%M")
  end

end
