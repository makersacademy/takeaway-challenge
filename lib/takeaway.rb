require_relative 'customer.rb'

class Takeaway
  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
    @current_order = @order_class.new(@menu)
  end

  attr_accessor :current_order # to remove at end

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
    display_current_order
    address = "#{customer.address[:address]}, #{customer.address[:post_code]}"
    number = customer.number
    checkout_message(address, number)
  end

  def place_order(_customer)
    text_confirmation
    order_message
  end

  def text_confirmation
    delivery_time = (Time.now + 60 * 60).strftime "%H:%M"
    "Thank you! Your order was placed and will be delivered by #{delivery_time}"
  end

private
  def checkout_message(address, number)
    display = "Your order is £#{@current_order.current_cost}.\nYour address is: #{address}\n"
    display << "Your number is: #{number}\n\nPlease press PLACE ORDER to confirm."
  end

  def order_message
    "Payment Confirmed.\nOrder placed.\nConfirmation test issued."
  end
end

test_takeaway = Takeaway.new

test_takeaway.add_to_order(2, 2)
test_takeaway.add_to_order(4, 2)
test_takeaway.add_to_order(5, 1)

puts test_takeaway.current_order.inspect

test_takeaway.remove_from_order(4, 1)

puts test_takeaway.current_order.inspect
