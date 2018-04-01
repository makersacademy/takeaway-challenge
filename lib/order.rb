require_relative 'order_item'

class Order

  attr_reader :state

  def initialize
    @state = :in_progress
    @items = []
  end

  def add_item dish, quantity
    @items << OrderItem.new(dish, quantity)
    "Added to order: " +  @items.last.description
  end

  def calculate_total
    @items.reduce(0) { |x,y| x + y.price }
  end
end
