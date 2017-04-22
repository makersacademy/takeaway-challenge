require_relative 'order_selection'

class Terminal

  attr_reader :menu, :order

  def initialize(menu = MenuPrinter.new, order = OrderSelection.new)
    @menu = menu.menu.the_menu
    @order = order
  end

  def view_menu

  end

  def add_to_order(item,quantity)
    @order.add_item(item,quantity)
  end

end
