require_relative "restaurant"

class Order
  attr_reader :total, :restaurant, :select, :receipt, :send_order

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @total = []
    @select = []
    @send_order = false
  end

  def select_meal(meal)
    @restaurant.available?(meal) ? @select.push(@restaurant.dishes[meal]) :
      (raise "Meal does not exist, sorry!")
  end

  def total_order
    @select.each { |array| total.push(array[1]) }
    receipt = total.sum
  end

  def confirm
    !send_order
  end
end
