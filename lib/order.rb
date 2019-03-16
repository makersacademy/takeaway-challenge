require_relative 'item'
class Order
  attr_reader :order, :total
  def initialize
    @order = []
    @total = 0
  end

  def add(item = Item)
    @order << item
    @total += item.total
  end

  def full
    @order
  end
end
