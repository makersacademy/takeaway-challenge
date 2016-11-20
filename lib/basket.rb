require 'menu'

class Basket
  def initialize(available_dishes)
    @dishes = available_dishes
    @basket_list = Hash.new(0)
  end

  def add(dish, quantity =1)
    @basket_list[dish] += quantity
    return @basket_list
  end

end
