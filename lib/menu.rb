
class Menu
  attr_reader :meals

  def initialize(meals)
    @meals = meals
  end

  def display
    list = ""
    meals.each do |meal, price|
      list << "#{meal}: #{price}, "
    end
    list[0..-3]
  end




end
