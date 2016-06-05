#gets food from menu
require './lib/printer.rb'
require './lib/order.rb'

class Customer

  DEFAULT_MENU = {"rice" => 1, "pasta" => 1, "bread" => 1,}
  attr_reader :order

  def initialize(menu = DEFAULT_MENU)
    @printer = Printer.new
    @order = Order.new(menu)
    @menu = menu
  end

  def see_menu
    @printer.print(@menu)
  end

  def choose(item, quantity)
    @order.select(item, quantity)
  end

end
