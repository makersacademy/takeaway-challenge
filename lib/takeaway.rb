require_relative 'restaurant'

class Takeaway

  attr_reader :restaurant, :selections

  def initialize(restaurant)
    @restaurant = restaurant
    @selections = Hash.new(0)
  end

  def select_dishes(dish, quantity)
    @selections[dish] += quantity
  end


end
