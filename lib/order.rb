require_relative 'menu'

class Order

  attr_reader :items

  def initialize
    @items = Hash.new(0)
    @total = 0
  end

  def add_to_order(dish, quantity = 1)
    @items[dish] += quantity
  end

  def order_total
    @items.reduce{ |sum, item| sum + item}
  end
end
