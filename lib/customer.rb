require_relative 'takeaway'

class Customer

  attr_accessor :takeaway

  def check_menu
    takeaway.show_menu
  end

  def add_item item, quantity = 1
    takeaway.take_order item, quantity
  end

  def review_order
    takeaway.check_order
  end

  def remove_order item_num
    takeaway.remove_order_item item_num
  end

  def place_order
    takeaway.confirm_order
  end

  def give_feedback
    takeaway.deliver_order
    #try and add Twilio text functionality
  end
end