
require_relative "order_printer"

class Order

  attr_reader :basket, :total, :printer

  def initialize(printer = OrderPrinter.new)
    @basket = []
    @total = 0.0
    @printer = printer
  end

  def add(dish)
    basket << dish
    note_price_of(dish)
  end

  private

  def note_price_of(dish)
    @total += dish[1]
  end

end
