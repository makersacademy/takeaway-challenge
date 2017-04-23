require 'order'
require 'menu'

class OrderManagement

  attr_reader :new_orders

  def initialize
    @new_orders = []
  end

  def place(*order)
    @new_orders << Order.new(order)
  end

end
