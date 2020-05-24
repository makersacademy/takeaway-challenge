class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def dish_available?(dish)
    @dishes.include?(dish)
  end

  def price(dish)
    @dishes[dish]
  end

  def print_menu
    @dishes.each do |dish, price|
      puts "%s: £%.2f" % [dish.capitalize, price]
    end
  end
  
end
