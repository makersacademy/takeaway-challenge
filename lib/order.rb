
require_relative "printer"
require_relative "menu"

# Understands how to process an order

class Order

  attr_reader :total, :basket

  def initialize(printer = Printer.new, menu = Menu.new)
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
    printer.print_all_orders_in(basket)
    printer.print_the(total)
  end

  private

  attr_reader :printer, :menu

  def update_total(food, quant)
    @total += menu.dishes[food] * quant
  end

end
