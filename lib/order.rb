class Order
  attr_reader :restaurant
  attr_accessor :choice, :order_total

  def initialize(restaurant = Restaurant.new)
    @choice = []
    @order_total = 0
    @restaurant = restaurant
  end

  def choose_order(order_number, quantity = 1)
    quantity.times { choice << restaurant.dishes[order_number - 1] }
    choice
  end

  def total
    choice.each { |item| self.order_total += item[:price] }
    order_total
  end

end
