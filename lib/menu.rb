class Menu
  attr_reader :meals

  def initialize(meals)
    @meals = meals
  end

  def display_menu
    display = @meals.map do |name, price| "#{name}, £#{price}" end
    display.join(", ")
  end
end
