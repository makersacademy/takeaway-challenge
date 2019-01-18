require_relative 'item'
class Order

  attr_reader :items, :order_total

  def initialize
    @items = []
    @order_total = 0
  end

  def place_order(choice)
    @items << choice
    add_to_order_total(choice)
  end

  private

  def add_to_order_total(item)
    @order_total += item.price
  end
end
