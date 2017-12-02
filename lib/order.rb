require_relative 'restaurant.rb'
class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(food, restaurant = Restaurant.new)
    # got to test whether or not the food is on the menu
    # before pushing it into current_order
    @current_order << food
  end

  def food_exist?(food)
    for i in 0..menu.length
      food == menu[i].dish ? true : false
    end
  end

end
