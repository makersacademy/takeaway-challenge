require_relative "menu"
require_relative "order"

class Restaurant

  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    @menu.print
  end

  def place_order
    @order = Order.new(@menu.menu_items)
  end

end
