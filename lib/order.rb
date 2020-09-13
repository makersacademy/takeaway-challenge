require_relative 'restaurant'

class Order
  attr_reader :restaurant, :basket, :total

  def initialize(restaurant)
    @restaurant = restaurant
    @basket = []
    @total = 0
  end

  def add(dish_name, qty)
    dish = @restaurant.find_dish(dish_name)
    @basket << { dish: dish, qty: qty }
    @total += dish.price * qty
  end
end
