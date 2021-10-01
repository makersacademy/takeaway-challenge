require_relative "restaurant"
require_relative "order"

class Print
  attr_reader :restaurant, :order

  def initialize(restaurant = Restaurant.new, order = Order.new)
    @restaurant = restaurant
    @order = order
  end

  def print_dishes
    @restaurant.dishes
  end

  def print_selection
    @order.select
  end
end
