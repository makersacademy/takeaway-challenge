class MealList
  attr_reader :meals
  
  def initialize
    @meals = Array.new
  end

  def add_meal(meal)
    @meals << meal
  end 
end 
