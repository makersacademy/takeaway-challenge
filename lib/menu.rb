class Menu

  attr_reader :dishes

  def initialize
    @dishes ||= []
  end  

  def add_dish(dish)
    @dishes<<dish    
  end

  def dishes
    @dishes
  end  
  
end