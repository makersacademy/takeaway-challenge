class Menu

  attr_reader :dishes
    
  DISHES = {
    "Potato Wedges" => 2.50, 
    "Fish&Chips" => 8.50, 
    "Chicken Wings" => 5.99
  }
  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def read 
    dishes.map do |name, price|
      name + " £%.2f" % [price]
    end.join(", ")
  end
    
end
