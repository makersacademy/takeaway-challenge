require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @order = []
    @order_total = nil
  end

  def add_to_order(item, quantity=1)
    @order << {item => quantity}
  end

  def order_total

  end
end
