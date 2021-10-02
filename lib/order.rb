require_relative "restaurant"

class Order
  attr_reader :total, :restaurant, :select, :receipt

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @total = []
    @select = []
  end

  def select_meal(meal)
    @restaurant.available?(meal) ? @select.push(@restaurant.dishes[meal]) :
      (raise "Meal does not exist, sorry!")
  end

  def total_order
    @select.each { |array| total.push(array[1]) }
    receipt = total.sum
  end
end
