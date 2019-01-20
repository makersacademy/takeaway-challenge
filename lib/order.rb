require_relative './check_order.rb'

class Order

  attr_accessor :new_order

  def initialize(new_order = [])
    @new_order = new_order
  end

  def check_order
    order_check = CheckOrder.new(@new_order).check_order_is_valid
  end
end
