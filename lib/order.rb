require_relative "takeaway"

class Order
  attr_reader :id, :takeaway, :total, :items

  @@orders = []

  def initialize
    @id = 1 + @@orders.count
    @@orders.push(self)
    @total = 0
    @items = []
  end

  def print_restaurants(takeaway)
    raise "There are no restaurants at this takeaway." if takeaway.restaurants.empty?
    takeaway.print_restaurants
  end

  def print_menu(takeaway, restaurant)
    raise "This takeaway doesn't contain this restaurant." unless takeaway.restaurants.include?(restaurant)
    takeaway.print_menu(restaurant)
  end
  
end
