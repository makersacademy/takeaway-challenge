require_relative 'takeaway'

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

  def check_order
    takeaway.orders
  end
end