require_relative "restaurant"

class Order
  attr_reader :total, :restaurant, :select

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @total = 0
  end

  def select_meal(meal)
    @select = @restaurant.dishes[meal]
  end
end
