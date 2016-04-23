class Menu

  attr_reader :dishes
  
  def initialize
    @dishes = { beef_burger: '1.99',  cheese_burger: '1.99', chicken_wings: '0.49', coke: '0.99' } 
  end
  
  def select_dish(dish)
    dishes.select { |k,v| k == dish }
  end
  
end