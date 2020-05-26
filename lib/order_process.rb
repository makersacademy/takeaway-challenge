require_relative 'order'
require_relative 'menu'
require 'twilio-ruby'
require_relative 'send_sms'

class OrderProcess

  def initialize
    @restaurant_name = Menu.new.take_away_name
    @order = Order.new
  end

  def show_menu
    Menu.new.show_list
  end

  def select_items(customer_choice)
    @order.select_items(customer_choice)
  end

  def customer_order_summary
    @order.customer_order_summary
  end

  def subtotal
   @order.subtotal
  end

  def order_process
    puts "Welcome to #{@restaurant_name}"
    show_menu
    order_asker
    select_items(1)
    select_items(1)
    customer_order_summary
  end

  def confirmation_text
    Message.new.confirmation_text
  end

  private

  def order_asker
    puts "Enter an item number or checkout to pay"
  end
end