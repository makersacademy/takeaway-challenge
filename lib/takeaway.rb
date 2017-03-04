require_relative 'restaurant'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :restaurant

  def initialize(restaurant = Restaurant.new(self), order = Order.new(self))
    @restaurant = restaurant
    @menu = restaurant.menu
    @order = order
  end

  def add(dish, quantity = 1)
    fail "Sorry, we don't have #{dish} in our menu." unless @menu.contains?(dish)
    @order.add_item(dish, quantity)
    "You added #{quantity} #{dish}(s) to your order."
  end

  def order_summary
    fail "Sorry, but you have no items in your order to summarise" if @order.items.empty?
    @order.summarise
  end

  def total
    '£' + @order.calc_total.to_s
  end

  def reset
    @order = Order.new(self)
  end

  def pay(amount)
    @restaurant.checkout_order(amount)
  end

end
