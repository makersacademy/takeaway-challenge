class Menu
  attr_reader :dishes
  
  ERROR_DISH_EXISTS = "Error: that dish number already exists"
  
  def initialize 
    @dishes = Array.new 
  end
    
  def add(dish)
    @dishes.each do |on_menu| 
      raise ERROR_DISH_EXISTS if on_menu.number == dish.number
    end
    
    @dishes.push(dish)
    @dishes.last
  end
  
  def contains?(dish)
    return false if @dishes.empty?
    
    @dishes.each do |on_menu| 
      if on_menu.number == dish.number
        return true
      else
        return false
      end
    end
  end
  
end
