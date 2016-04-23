class Menu
  
  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end
  
  def read_menu
    return "The menu is empty" if dishes.empty?
    dishes.map do |dish, price|
      "%s: £%.2f" % [dish, price]
    end.join("\n")
  end
  
  def contains?(dish)
    dishes.has_key? dish
  end
  
end