
class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_m
    dishes.map do |dish, price|
      "#{dish.capitalize} : $#{price.to_f}"
    end.join(", ")
  end

  def dish_exists?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end


end
