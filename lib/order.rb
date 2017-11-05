require_relative "takeaway"

class Order
  attr_reader :id, :restaurant, :total, :items

  @@orders = []

  def initialize(restaurant)
    @id = 1 + @@orders.count
    @@orders.push(self)
    @restaurant = restaurant
    @total = 0
    @items = []
  end

end
