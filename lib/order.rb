
require_relative "order_printer"

class Order

  attr_reader :basket, :total, :printer, :menu

  def initialize(printer = OrderPrinter.new, menu = Menu.new)
    @basket = Hash.new(0)
    @total = 0.0
    @menu = menu
    @printer = printer
  end

  def add(food, quant=1)
    basket[food] += quant
    update_total(food, quant)
  end

  def summary
     printer.output_for(basket)
     printer.output_(total)
  end

  private

  def update_total(food, quant)
    @total += menu.dishes[food] * quant
  end

end
