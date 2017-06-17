
require_relative "order_printer"

class Order

  attr_reader :basket, :total, :printer, :menu

  def initialize(printer = OrderPrinter.new, menu = Menu.new)
    @basket = Hash.new(0)
    @total = 0.0
    @menu = menu
    @printer = printer
  end

  def add(dish, quant=1)
    basket[dish] += quant
    update_total(dish, quant)
  end

  def summary
     printer.format_(basket)
     printer.print_(basket)
     printer.print_(total)
  end

  private

  def update_total(dish, quant)
    @total += menu.dishes[dish] * quant
  end

end
