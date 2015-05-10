require_relative 'takeaway'

class Customer

  attr_accessor :takeaway

  def initialize
    @takeaway = yield
  end

  def see_menu
    takeaway.list
  end

  def place_order (qty = 1, dish)
    item = {dish => takeaway.list[dish]}
    qty.times { takeaway.register_order(item) }
  end

  def ask_confirmation
    takeaway.confirmation
  end

end
