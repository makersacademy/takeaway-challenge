require_relative "dish"

class Takeaway
  attr_accessor :food

  def initialize
    @food =
      { "piza": 5,
        "coke": 2 }
  end

  def display_dishes
    p @food
  end
end
