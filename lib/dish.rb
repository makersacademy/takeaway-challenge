class Dish
  attr_reader :food

  def initialize
    @food =
      { "pizza": 5,
        "coke": 2 }
  end
end
