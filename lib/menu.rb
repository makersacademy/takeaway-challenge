class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      :pizza => 5.00,
      :kebab => 4.00,
      :burger => 3.50,
      :hotdog => 4.50,
      :chips => 2.00
    }
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
