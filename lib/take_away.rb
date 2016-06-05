require_relative 'menu'
require_relative 'order_parser'

#Knows about the menu and gets orders

class TakeAway

  def initialize(menu = Menu.build_default_menu, parser_class = OrderParser)
    @menu = menu
    @order = nil
    @parser_class = parser_class
  end

  def show_menu
    @menu.print_menu
  end

  def take_order
    @parser_class.input_instructions
    @order = @parser_class.parse(gets)
  end

  def order_price
    @menu.price_total(@order)
  end

  private






end
