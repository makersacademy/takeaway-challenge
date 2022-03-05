require_relative 'menu'

class Order

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = Hash.new(0)
    @menu = menu
  end

  def add_dish(dish)
    @menu.check_availability(dish)
    @order[dish] += @menu.dishes[dish]
  end

  def remove_dish(dish)
    @order[dish] -= @menu.dishes[dish]
  end
end
