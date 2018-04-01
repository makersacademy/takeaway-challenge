require_relative 'order_item'

class Order

  MESSAGES = { not_found: 'Item not found' }

  attr_reader :state

  def initialize
    @state = :in_progress
    @items = []
  end

  def add_item dish, quantity
    @items << OrderItem.new(dish, quantity)
    "Added to order: " +  @items.last.description
  end

  def remove_item item_id
    raise MESSAGES[:not_found] if !@items.any? { |item| item.id == item_id }
    @items.delete_if { |item| item.id == item_id }
  end
    
  def calculate_total
    @items.reduce(0) { |x,y| x + y.price }
  end
end
