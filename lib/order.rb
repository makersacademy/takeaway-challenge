require_relative "restaurant"

class Order
  attr_reader :total, :restaurant, :select, :receipt

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @total = []
    @select = []
  end

  def select_meal(meal)
    @select.push(@restaurant.dishes[meal])
  end

  def total_order
    @select.each { |array| p total.push(array[1].round(2)) }
    p receipt = total.sum
  end
end
