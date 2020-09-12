class Takeaway
  attr_reader :restaurant

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
  end
end