class Menu

  attr_accessor :dishes

  def initialize(dishes)

    @dishes = dishes
  end

  def print
    array = @dishes.map do |dish, price|
      "#{dish}: £#{price}"

    end.join(", ")
    
    
    
  end

    


 
end
