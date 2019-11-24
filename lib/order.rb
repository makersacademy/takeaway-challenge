require_relative 'order_listing'

class Order
  attr_reader :items, :customer

  NO_CUSTOMER_ASSIGNED = 'This order currently has no recipient'

  def initialize(order_listing_class = OrderListing)
    @items = []
    @order_listing_class = order_listing_class
  end

  def assign_customer(customer)
    @customer = customer
  end

  def add_item(item)
    raise NO_CUSTOMER_ASSIGNED unless customer

    existing_entry = selected(item)
    existing_entry ? existing_entry.add_serving : @items << @order_listing_class.new(item)
  end

  def remove_item(item)
    existing_entry = selected(item)
    existing_entry.quantity > 1 ? existing_entry.remove_serving : @items.delete(existing_entry)
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

  def selected(item)
    @items.select { |ordered| ordered.dish == item }.pop
  end
end
