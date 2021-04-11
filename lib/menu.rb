class Menu
  attr_reader :meal

  def initialize(meal)
    @meal = meal
  end

  def display
    @meal.map { |name, price| "#{name}: £#{price}" }.join(", ")
  end
end
