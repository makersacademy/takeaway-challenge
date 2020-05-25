class Menu

  attr_reader :dishes
    
  def initialize(dishes) # default dishes when a menu instance is created
    @dishes = dishes
  end

  def read 
    dishes.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]  # format the price into a string with two desimal point
    end.join(", ")
  end

  def has_dish?(dish)
    !!dishes[dish]
  end
    
end
