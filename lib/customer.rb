require_relative 'menu'
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
end
