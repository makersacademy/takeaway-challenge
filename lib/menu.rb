
class Menu

  attr_reader :meals

  def initialize
    @meals = {
    pasta:  4.50,
    curry:  3.70,
    burger:  2.80
    }
  end

  def display_meals
    meals.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

end
