class Order 

  attr_reader :dishes, :menu 

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, number)
    fail "#{dish.capitalize} is not available" unless menu.dish_available?(dish) 
    dishes[dish] = number
  end 
end
