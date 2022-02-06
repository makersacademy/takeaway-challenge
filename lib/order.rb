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

  def total 
    dish_total.inject(:+) # passing a symbol to call method to add 
  end 

  def dish_total 
    dishes.map do |dish, number|
      menu.price(dish) * number
    end  
  end 
end
