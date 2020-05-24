class Menu

  attr_reader :dishes
    
  LIST = {
    "Potato Wedges" => 2.5, 
    "Fish&Chips" => 8.50, 
    "Chicken Wings" => 5.99,
    "Breadsticks" => 3.99,
    "Hallomi Fries" => 5.50,
    "Cheese Cake" => 6.50 
    }
  def initialize # default dishes when a menu instance is created
    @dishes = LIST
  end

  def read 
    dishes.map do |name, price|
      name + " £%.2f" % [price]  # format the price into a string with two desimal point
    end.join(", ")
  end
    
end
