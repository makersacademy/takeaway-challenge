class Order

  attr_reader :order_items, :order_total

  def initialize
    @order_items = []
    @order_total = 0
  end

  def add_to_order(item, quantity)
    quantity.times do
      @order_items.push(item)
    end
    "#{item} - Qty:#{quantity} added to order"
  end

  def display_order
    "Current order: #{order_items.uniq.map { |x| "#{x} - Qty:#{order_items.count(x)}" }.join(', ')}"
  end

  def display_total
    @order_total
  end
end
