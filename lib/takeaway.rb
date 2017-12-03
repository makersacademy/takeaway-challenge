require_relative './menu.rb'
require_relative './order.rb'

class TakeAway
  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def view_menu
    @menu.show_dishes
  end

  def create_order(dish)
    @order = Order.new(dish)
    @order.current_order
  end

  def view_order
    raise 'You have not ordered anything yet!' unless @order
    @order.current_order
  end

  def add_more_dishes(dish)
    @order.add_to_order(dish)
  end
end
