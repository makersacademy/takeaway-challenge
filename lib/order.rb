class Order
  attr_reader :restaurant, :basket

  def initialize(restaurant)
    @restaurant = restaurant
    @basket = []
  end
end