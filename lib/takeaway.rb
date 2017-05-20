require_relative 'menu'

# It is responsible for handling user requests

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def view_menu
    @menu.view_menu
  end

  def create_new_order(menu_item)
    @order = Order.new(menu_item)
    view_current_order
  end

  def view_current_order
    raise 'No items currently ordered' if !@order
    @order.current_order
  end

end
