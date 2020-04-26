class Menu
  attr_reader :dishes
  
  ERROR_DISH_EXISTS = "Error: that dish number already exists"
  ERROR_DISH_NOT_EXISTS = "Error: that dish is not on the menu"
  
  def initialize 
    @dishes = Array.new 
  end
    
  def add(dish)
    raise ERROR_DISH_EXISTS if contains?(dish)
    
    @dishes.push(dish)
    @dishes.last
  end
  
  def get(number)
    raise ERROR_DISH_NOT_EXISTS if @dishes.empty?
    
    @dishes.each do |on_menu| 
      if on_menu.number == number
        return on_menu
      end
    end
    raise ERROR_DISH_NOT_EXISTS
  end

#   TODO: do we need this?  
#   def locate(number)
#     raise ERROR_DISH_NOT_EXISTS if @dishes.empty?
#     
#     raise ERROR_DISH_NOT_EXISTS
#   end
  
  private
  
  def contains?(dish)
    return false if @dishes.empty?
    
    @dishes.each do |on_menu| 
      return on_menu.number == dish.number
    end
  end
  
end
