require_relative "dish"

class Takeaway
  attr_accessor :food, :order

  def initialize
    @food =
      { "pizza": 5,
        "coke": 2 }
    @order = []
  end

  def display_dishes
    p @food
  end

  def select_dishes(select)
    @order << @food[:select]
  end
end
