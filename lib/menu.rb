class Menu
  attr_reader :meals
  def initialize meals = [] 
    @meals = meals
  end
  def add meal
    @meals << meal
  end
end