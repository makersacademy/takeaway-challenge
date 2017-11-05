require './lib/menu.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.show
  end

  def add(dish, quantity = 1)
    @order.add_dish(dish, quantity)
  end

  def check_total
    @order.total
  end
end
