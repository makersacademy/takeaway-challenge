require 'restaurant'

class Order
  attr_reader :restaurant, :basket

  def initialize(restaurant)
    @restaurant = restaurant
    @basket = []
  end

  def add(dish_name, qty)
    @dish_name = dish_name
    @qty = qty
  end
end