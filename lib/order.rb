require_relative 'order_items'

class Order

  attr_reader :items

  def initialize(restaurant, items = OrderItems.new(restaurant.menu))
    @restaurant = restaurant
    @items = items
    @closed = false
  end

  def checkout
    raise "Empty basket!" if empty_basket?
    items.lock
    @closed = true
  end

  def checked_out?
    @closed
  end

  def total_price
    total = 0
    items.list.each { |item, quantity|
      total += item_price(item) * quantity
    }
    total
  end

  private
  def item_price(item)
    @restaurant.menu.dishes_list.select { |dish| dish.name == item }.first.price 
  end

  def empty_basket?
    items.list.empty?
  end

end
