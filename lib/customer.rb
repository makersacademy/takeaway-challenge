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
    # item = {dish => takeaway.list[dish]}
    qty.times { takeaway.register_order({dish => takeaway.list[dish]}) }
  end

end
