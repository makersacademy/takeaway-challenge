
require_relative 'order'

class Menu
  attr_reader :meals_list

  def initialize
    @meals_list = {
      "nachos"=>5.00,
      "ribs"=>6.00,
      "chilli"=>4.00,
      "burger"=>4.00,
      "sundae"=>3.00
    }
  end

  def print_menu
    meals_list.map do |dish, price|
      "%s £%.2f" % [dish.capitalize.to_s, price]
    end
  end

  def has_meal? (meal)
    meals_list.key?(meal)
  end

end
