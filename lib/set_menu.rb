require_relative 'meal_list'
require_relative 'meal'

module Menu
  def self.curry_house
    curry_house = MealList.new
    curry_house.add_meal(Meal.new(:bhuna, 6.99))
    curry_house.add_meal(Meal.new(:mkhani, 4.50))
    curry_house.add_meal(Meal.new(:bhaji, 1.10))
    curry_house
  end
end
