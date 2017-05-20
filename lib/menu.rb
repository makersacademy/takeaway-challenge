class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
      "quarter chicken": 3.5,
      "half chicken": 6.0,
      "whole chicken": 10.50,
      "small fries": 1.99,
      "large fries": 2.50
    }
  end
end
