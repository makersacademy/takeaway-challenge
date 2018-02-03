class Menu

  attr_reader :dishes
  
  def initialize
    @dishes = {
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     }
  end
end
