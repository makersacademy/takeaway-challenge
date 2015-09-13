require_relative 'restaurant.rb'

class Order
  def initialize(restaurant)
    @restaurant = restaurant
  end
  def order
    menu.list
    "Please select from the above items"
  end
end
