require_relative "menu"
require_relative "order"
require_relative "text_message"

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = Order.new
  end

  def see_menu
    @menu.print
  end

  def add_to_order(dish, quantity = 1)
    @order.add(dish, quantity)
    "#{dish} x#{quantity} added to your order"
  end

  def remove_from_order(dish, quantity = 1)
    @order.remove(dish, quantity)
    "x#{quantity} portions of #{dish} removed from order"
  end

  def order_summary
    @order.sub_total
  end

  def order_total
    @order.total
  end

  def confirm_order
    fail "Order empty: please add items to order" if @order.basket.empty?
    send_text
    "Order received. Please await SMS for order confirmation"
  end

private

attr_reader :menu, :order

  def send_text(text_message = TextMessage.new)
    text_message.send
  end
end

def welcome_message
  puts "----".center(20)
  puts "Welcome to Delicious Express"
  puts "To view our menu, use see_menu"
  puts "To place an order,use add_to_order(dish, quantity)"
  puts "To remove a dish from the order,use remove_from_order(dish, quantity)"
  puts "To view a summary of your order,use order_summary and order_total"
  puts "To confirm your order use confirm_order"
  puts "Use welcome_message to view these options again"
  puts "---".center(20)
end

welcome_message
