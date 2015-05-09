require_relative 'takeaway'
require_relative 'twilio'

class Customer

  attr_reader :takeaway
  def initialize
    @takeaway = yield
  end

  def check_menu
    takeaway.list_menu
  end

  def select_item item, quantity = 1
    takeaway.add_order_item item, quantity
  end

  def check_order
    takeaway.orders
  end

  def check_order_total
    takeaway.give_order_total
  end

  def remove_previous_order
    takeaway.remove_order
  end

  def confirm_order
    fail "No order to confirm" if takeaway.orders.empty?
    puts "Thank you for your order of #{takeaway.orders}"
    puts "The total cost of your order is : #{takeaway.give_order_total}"
    takeaway.message_sender.send_message
  end
end