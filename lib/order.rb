require_relative 'takeaway'
class Order

  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add(item)
    @order_list << item
  end

end
