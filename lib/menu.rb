require_relative 'takeaway'

class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def add_dish(dish, quantity = 1)
    @dishes[dish] += quantity
  end

  def view_menu
    @dishes.map  do |dish, price|
      [dish.to_s.capitalize, price]
    end.join(', ')
  end
end
