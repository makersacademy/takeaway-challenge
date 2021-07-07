class Menu
  
  attr_reader :dishes 

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    list = dishes.map do |dish, price|
      "#{dish.capitalize} £#{price}"
    end
    list.join(', ')
  end
end