class Menu
  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end
  
  def menu_print
    dishes.map do |item, price|
      "%s: £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end
end