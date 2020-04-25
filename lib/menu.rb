class Menu
  
  def initialize 
    @dishes = Array.new 
  end
    
  def add(new_dish)
    @dishes.each do |dish| 
      if dish.number == new_dish.number
        raise "Error: that dish number already exists"
      end
    end
    @dishes.push(new_dish)
    @dishes.last
  end
  
  def get(number)

  end

end
