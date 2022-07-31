require_relative 'takeaway'
require_relative 'receipt'

class Order
  attr_reader :current_order

  def initialize
    @current_order = {}
  end



  def order (item, quantity = 1)
    current_order[item] = quantity
    return current_order
  end


end
