require_relative 'order_management.rb'
require_relative 'takeaway.rb'

class FoodMenu

  attr_reader :food

  def initialize(food)
    @food = food
  end

  def print
    food.map { |dish, price| 
      "#{dish}: #{price}"
    } .sort
    .join(", ")
  end

  def we_serve?(dish)
    food[dish] != nil
  end

  def price(dish)
    food[dish]
  end

end
