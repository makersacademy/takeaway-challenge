require_relative "menu"
require_relative "order_system"

class Takeaway
  attr_reader :menu, :order_system

  def initialize
    @menu = Menu.new
    @order_system = OrderSystem.new(@menu)
  end

  def show_menu
    menu.print_menu
  end

  def order(item, quanitity)
    order_system.place_order(item, quanitity)
  end

  def show_order
    order_system.show_order
  end

end
