require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @order = []
    @total = 0
  end

  def add_to_order(item, quantity=1, price)
    @order << {:item => item, :quantity => quantity, :price => price}
  end

  def order_total
    @order.each do |full_order|
      @total += (full_order[:quantity] * full_order[:price])
    end
    @total
  end
end
