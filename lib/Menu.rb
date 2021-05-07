# This first class is going to represent the dishes of the restaurant
class Menu 
  def initialize
    @dishes = { Pizza: 4, 
      Curry: 5, 
      Roast_Dinner: 9 }
  end

  def list_dishes
    @dishes
  end
end
