require_relative 'restaurant'

class Order
  attr_reader :restaurant, :basket

  def initialize(restaurant)
    @restaurant = restaurant
    @basket = []
  end

  def add(dish_name, qty)
    dish = @restaurant.find_dish(dish_name)
    @basket << { dish: dish, qty: qty }
  end
end