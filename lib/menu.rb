
class Menu
  attr_reader :food

  def initialize
    @food = {"Chips" => 1, "Burger" => 2}
  end

  def check_menu
    list = []
    @food.each do |key, value|
      list << "#{key}: £#{value} \n"
    end
    list.join
  end

  def dish_available?(dish)
    @food.include?(dish)
  end

  def cost(dish, quantity)
    @food[dish] * quantity
  end

end
