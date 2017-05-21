class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
      "chicken burger": 3.49,
      "chicken wings": 4.99,
      "whole chicken": 10.49,
      "fries": 1.99,
      "mozzarella sticks": 1.99
    }
  end

  def print_dishes
    dishes.each { |dish, price| puts "#{dish}: #{price}" }
  end
end
