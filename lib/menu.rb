class Menu
  attr_reader :food, :order, :menu, :printed_menu

  def initialize(order_class = Order, printed_menu = PrintedMenu.new)
    @order_class = order_class
    @printed_menu = printed_menu
  end

  def print
    printed_menu.print_printed_menu
  end
end
