require_relative 'takeaway'
require_relative 'twilio'

class Customer

  attr_accessor :takeaway
  def initialize
    @takeaway = Takeaway.new
  end

  def check_menu
    takeaway.list_menu
  end

  def select_item item, quantity = 1
    takeaway.add_order_item item, quantity
  end

  #consider_new_user story of removing an item

  def confirm_order
    #insert code that asks for some sort of input to confirm
    takeaway.message_sender.send_message
  end

  def check_order
    takeaway.orders
  end
end