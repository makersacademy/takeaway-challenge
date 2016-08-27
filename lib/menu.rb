require_relative 'meals'

class Menu
  attr_reader :meals

  def initialize(meals)
    @meals = meals
  end

  def print_menu
    meals.map do |dish, price|
      "%s £%.2f" % [dish.capitalize.to_s, price]
    end.join(", ")
  end
end
