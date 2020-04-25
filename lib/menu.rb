class Menu
  
  def initialize 
    @dishes = Array.new 
  end
    
  def add(new_dish)
    @dishes.each do |dish| 
      raise "Error: that dish number already exists" if dish.number == new_dish.number
    end
    
    @dishes.push(new_dish)
    @dishes.last
  end
  
  def get(number)

  end

end
