#gets food from menu
require './lib/printer.rb'
require './lib/order.rb'

class Customer

  attr_reader :order

  def initialize(menu)
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

  def pay(amount)
    @order.confirm(amount)
  end

end
