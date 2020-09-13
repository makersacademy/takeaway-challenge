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

  def place(total)
    raise 'Incorrect total' unless correct_total?(total)
  end

  private

  def correct_total?(total)
    actual_total = @basket.map {
      |item| item[:dish].price * item[:qty] }.reduce(:+)
    actual_total == total
  end
end