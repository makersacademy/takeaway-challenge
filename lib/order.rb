require_relative 'menu'

class Order

  attr_reader :order_list

  def initialize(menu_instance)
    @menu = menu_instance
    @order_list = {}
  end

  def add_order(dish, quantity)
    single_order = { @menu.menu.keys[dish.to_i - 1] => quantity }
    @order_list.merge!(single_order)
  end

end
