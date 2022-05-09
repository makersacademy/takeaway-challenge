require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :order, :text

  def initialize
    @order = []
    @total = 0
    @text = Text.new
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

  def order_correct?
    true if @total
  end
end
