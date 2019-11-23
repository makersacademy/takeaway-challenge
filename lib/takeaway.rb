require_relative "dish"

class Takeaway
  attr_accessor :food, :order

  def initialize
    @food =
      { "pizza": 5,
        "coke": 2 }
    #need to figure out how to get the one from other class
    @order = []
    p Dish.food
  end

  def display_dishes
    p @food
  end

  def select_dishes(select)
    @order << @food[:select]
  end
end
