require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add_to_order(item, quantity=1)
    @order << {item => quantity}
  end
end
