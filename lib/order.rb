require_relative 'menu'

class Order

  attr_reader :menu, :current_order, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = []
    @total = 0
  end

  def add_dish(dish, quantity = 1)
    raise "Unfortuantely, we do not have this dish." unless menu.view_menu.include?(dish)
    @current_order << [dish, quantity]
    @total += @menu.view_menu[dish] * quantity
  end

  def check_total
  end

end