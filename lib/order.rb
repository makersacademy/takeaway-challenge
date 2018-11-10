require_relative 'restaurant'

class Order

  attr_reader :order

  def initialize(restaurant)
    @restaurant = restaurant
    @order = []
  end

  def list_dishes
    @restaurant.list_dishes
  end

  def add(name,quantity = 1)
    quantity.times { order << @restaurant.dish(name) }
  end

  def check
    order_check = ""
    total = 0
    @order.each do |dish|
      total += dish.price
      order_check << "#{dish.name}\n"
    end
    order_check << "Your total is £#{total}.\n"
  end

end
