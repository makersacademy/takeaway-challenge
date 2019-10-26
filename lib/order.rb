require_relative 'menu'

class Order

  attr_reader :list, :menu

  def initialize(menu)
    @list = {}
    @menu = menu
  end

  def select_order(dish, quantity)
    raise "Cannot select dish. Dish is not on the menu" unless menu.dish_included?(dish.to_sym)
    list[dish] = quantity.to_i
    list
  end

  def sum
    list.map do |dish, quantity|
      menu.price(dish)*quantity
    end
  end

  # def check_sum

  # end

end