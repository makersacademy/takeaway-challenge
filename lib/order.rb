require_relative 'restaurant'

class Order

  def initialize(restaurant)
    @restaurant = restaurant
    @order = []
  end

  def list_dishes
    @restaurant.list_dishes
  end

  def add_to_order(name,quantity = 1)
    quantity.times { order << @restaurant.dish(name) }
  end

  def order
    @order
  end

end
