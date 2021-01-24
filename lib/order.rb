require_relative 'menu'

class Order

attr_reader :order_list, :menu

  def initialize(menu)
    @menu = menu
    @order_list = {}
  end

  def add(dish, quantity)
    @order_list[dish] = quantity
  end

  def print_menu
    menu.print
  end


end
