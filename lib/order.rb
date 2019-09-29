require_relative 'takeaway'
require_relative 'menu'

class Order

  attr_accessor :itemnum, :quantity

  def place_order(itemnum, quantity)
    @itemnum = itemnum
    @quantity = quantity
  end
end
