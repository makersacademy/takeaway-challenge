require_relative 'customer.rb'
require_relative 'order.rb'
require_relative 'menu.rb'
require_relative 'send_text.rb'

class Takeaway
  def initialize(menu = Menu.new, order_class = Order, text = SendText.new)
    @menu = menu
    @order_class = order_class
    @current_order = @order_class.new(@menu)
    @text = text
  end

  def display_menu
    @menu.display_menu
  end

  def display_current_order
    @current_order.display_current_order
  end

  def add_to_order(item_number, quantity)
    @current_order.add_to_order(item_number, quantity)
  end

  def remove_from_order(item_number, quantity)
    @current_order.remove_from_order(item_number, quantity)
  end

  def checkout(customer)
    return "Please add items before checking out." if empty_order?

    display_current_order
    address = "#{customer.address[:address]}, #{customer.address[:post_code]}"
    number = customer.number
    checkout_message(address, number)
  end

  def place_order(_customer)
    return "Please add items before placing an order." if empty_order?

    order_message # redundant? 
    text_confirmation
  end

private

  def checkout_message(address, number)
    display = "Your order is £#{@current_order.current_cost}.\nYour address is: #{address}\n"
    display << "Your number is: #{number}\n\nPlease press PLACE ORDER to confirm."
  end

  def order_message
    "Payment Confirmed.\nOrder placed.\nConfirmation text issued."
  end

  def text_confirmation
    delivery_time = (Time.now + 60 * 60).strftime "%H:%M"
    @text.send_confirmation(delivery_time)
  end

  def empty_order?
    @current_order.empty?
  end
end
