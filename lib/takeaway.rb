require_relative 'menu'
require_relative 'order'

# It is responsible for handling user requests

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def view_menu
    @menu.view_menu
  end

  def create_new_order(menu_item, price)
    @order = Order.new(menu_item, price)
    view_current_order
  end

  def view_current_order
    raise 'No items currently ordered' unless @order
    @order.current_order
  end

  def select_dish(menu_item, price)
    @order.add_to_order(menu_item, price)
  end

end
