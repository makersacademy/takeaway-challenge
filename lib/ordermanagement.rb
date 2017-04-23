require 'order'
require 'menu'

class OrderManagement

  attr_reader :new_orders

  def initialize
    @new_orders = []
  end

  def place(*order, total)
    @new_orders << Order.new(order, total)
  end

end
