require_relative 'menu'
require_relative 'order'
class Customer

  attr_reader :order

  def initialize(order = Order.new)

    @order = order
    @menu = Menu.new

  end

  def print_menu
    @menu.view_menu
  end


  def place_order

    @order.save_items(@menu.options)

  end

  def verify_order
    @order.check_order(@menu.options)
  end

  def finish_order
    @order.confirm_order
    @order = Order.new
  end
end
