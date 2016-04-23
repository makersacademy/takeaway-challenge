class Menu

  attr_reader :dishes
  
  def initialize
    @dishes = { 'beef burger' => '1.99',  'cheese burger' => '1.99', 'chicken wings' => '0.49', 'coke' => '0.99' } 
  end
  
  def select_dish(dish, multiple = 1)
    array = []
    multiple.times { array << required_dish(dish) }
    array
  end
  
  def add_dish(name, price)
    dishes[name] = price
  end
  
  def remove_dish(name)
    dishes.delete(name)
  end
  
  private
  
  def required_dish(dish)
    required_dish = dishes.select { |k,v| k == dish }
  end

end