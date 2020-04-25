class Menu
  
  ERROR_DISH_EXISTS = "Error: that dish number already exists"
  
  def initialize 
    @dishes = Array.new 
  end
    
  def add(new_dish)
    @dishes.each do |dish| 
      raise ERROR_DISH_EXISTS if dish.number == new_dish.number
    end
    
    @dishes.push(new_dish)
    @dishes.last
  end
  
  def list
    @dishes
  end
  
end
