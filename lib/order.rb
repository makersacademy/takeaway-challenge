require 'item'

class Order
  attr_reader :items

  def initialize
    @items = []
    @total = 0
  end

  def order(item)
    @items << item
    total(item)
  end

  def total(item)
    item.dish.price * item.qty
  end
end