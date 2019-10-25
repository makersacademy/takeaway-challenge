require 'order_item'

class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add(dish, quantity)
    @items << OrderItem.new(dish, quantity)
  end

  def total
    total = 0

    @items.each do |item|
      total += item.dish.price * item.quantity
    end

    total
  end
end