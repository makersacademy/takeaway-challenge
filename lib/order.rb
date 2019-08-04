require_relative 'order_items'

class Order

  attr_reader :items, :customer_number, :time

  def initialize(restaurant, customer_number, items = OrderItems.new(restaurant.menu))
    @restaurant = restaurant
    @customer_number = customer_number
    @items = items
    @paid = false
    @closed = false
  end

  def checkout
    raise "Empty basket!" if empty_basket?
    items.lock
    @closed = true
    @time = Time.now
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
  
  def confirm_payment
    @paid = true
  end

  def paid?
    @paid
  end

  private
  def item_price(item)
    @restaurant.menu.dishes.select { |dish| dish.name == item }.first.price 
  end

  def empty_basket?
    items.list.empty?
  end

end
