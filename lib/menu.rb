class Menu
  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |dish, price|
      "#{dish.to_s.capitalize} £#{price}"
    end.join(", ")
  end  

end
