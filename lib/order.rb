require_relative 'customer'

class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def added?
    @order.empty? ? false : true
  end
end
