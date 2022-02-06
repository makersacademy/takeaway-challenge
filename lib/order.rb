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

  def dish_available?(dish)
    !dishes[dish].nil? 
  end 

  def total 
    dish_total.inject(:+)
  end 

  def dish_total 
    dishes.map do |dish, number|
      menu.price(dish) * number
    end  
  end 
end
