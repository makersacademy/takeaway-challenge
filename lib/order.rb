require 'order_listing'

class Order
  def initialize
    @items = []
  end

  def add_item(item)
    existing_order = @items.select { |order_listing| order_listing.dish == item }.pop
    if existing_order
      existing_order.add_serving
    else
      @items << OrderListing.new(item)
    end
  end

  def view
    ordered_items.map { |order| order.entry }.join("\n")
  end

  def total
    prices = ordered_items.map { |ordered| ordered.dish.price * ordered.quantity }
    prices.reduce(&:+)
  end

  private

  def ordered_items
    @items
  end
end
