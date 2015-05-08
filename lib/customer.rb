require_relative 'takeaway'
require_relative 'twilio'

class Customer

  attr_accessor :takeaway
  def initialize
    @takeaway = yield
  end

  def check_menu
    takeaway.list_menu
  end

  def select_item item, quantity = 1
    takeaway.add_order_item item, quantity
  end

  #consider_new_user story of removing an item
  def check_order
    takeaway.orders
  end

  def check_order_total
    takeaway.give_order_total
  end

  def confirm_order
    #insert code that asks for some sort of input to confirm
    puts "Thank you for your order of #{takeaway.orders}"
    takeaway.message_sender.send_message
  end
end