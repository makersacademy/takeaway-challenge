require_relative './order_printer.rb'

class Order

  def initialize
    @choices = []
  end

  def add(dish, quantity = 1)
    @choices << {dish => quantity}
  end

  def get(index)
    all[index]
  end

  def summary(order_printer = OrderPrinter)
    order_printer.print(all)
  end

  private

  def all
    @choices
  end

end