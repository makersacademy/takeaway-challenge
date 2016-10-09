require_relative 'menu'

class Order

  attr_reader :menu, :current_order, :order_total

  def initialize
    @menu = Menu.new
    @current_order = []
    @order_total = 0
  end

  def select_dish(item)
    @current_order << @menu.menu_list[item - 1]
  end

end
