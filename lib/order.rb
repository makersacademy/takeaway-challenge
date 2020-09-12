require_relative 'restaurant'

class Order
  attr_reader :restaurant, :id, :status, :basket

  def initialize(restaurant, id)
    @restaurant = restaurant
    @id = id
    @status = 'open'
    @basket = []
  end

  def add(dish_name, qty)
    dish = @restaurant.find_dish(dish_name)
    @basket << { dish: dish, qty: qty }
  end
end