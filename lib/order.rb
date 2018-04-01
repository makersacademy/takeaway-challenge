require_relative 'order_item'
require_relative 'order_printer'

class Order

  include OrderPrinter

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

  def complete!
    @state = :complete
  end

  def describe
    pretty_print(items: @items.map(&:description).join("\n"), total: calculate_total, status: @status.to_s)
  end
end
