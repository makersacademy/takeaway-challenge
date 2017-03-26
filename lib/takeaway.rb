require_relative 'order'
require_relative 'restaurant'

class Takeaway

  attr_reader :order

  def initialize
    @restaurant = Restaurant.new
    @order = Order.new
  end

  def select_dish(dish, amount)
    # @order = Order.new if complete?
    order.add(dish, amount)
    "#{amount}x #{dish} added to your basket"
  end

  private
  attr_reader :restaurant

  def complete?
    !order
  end

  def get_price(dish)
    restaurant.menu
  end
end
