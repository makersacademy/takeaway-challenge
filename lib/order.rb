require_relative 'order_items'

class Order

  attr_reader :items

  def initialize(restaurant, items = OrderItems.new(restaurant.menu))
    @restaurant = restaurant
    @items = items
    @closed = false
  end

  def checkout
    items.lock
    @closed = true
  end

  def checked_out?
    @closed
  end

end
