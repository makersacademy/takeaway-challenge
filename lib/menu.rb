class Menu
  attr_reader :dishes
  
  ERROR_DISH_EXISTS = "Error: that dish number already exists"
  
  def initialize 
    @dishes = Array.new 
  end
    
  def add(dish)
    raise ERROR_DISH_EXISTS if contains?(dish)
    
    @dishes.push(dish)
    @dishes.last
  end
  
  def get(number)
    raise "Error: that dish is not on the menu"
  end
  
  private
  
  def contains?(dish)
    return false if @dishes.empty?
    
    @dishes.each do |on_menu| 
      return on_menu.number == dish.number
    end
  end
  
end
