
class Order

  attr_reader :basket, :total, :printer

  def initialize(printer = OrderPrinter.new)
    @basket = {}
    @total = 0
    @printer = printer
  end

  def add
  end

end
