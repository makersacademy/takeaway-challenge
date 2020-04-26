class Menu
  attr_reader :listOfDishes
    
  def initialize
    @listOfDishes = {
          croissant: 2,
          panini: 4,
          coffee: 3,
          tea: 3,
          juice: 3.5
    }
  end
  
  def show
    @listOfDishes.each do |key, value|
      "#{key}: £#{value}"
    end
    
    @listOfDishes
  end

end