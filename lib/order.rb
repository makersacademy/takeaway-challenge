require_relative './formatter'

class Order

  attr_reader :selection, :total

  def initialize (formatter = Formatter.new)
    @selection = {}
    @total = 0
    @formatter = formatter
  end

  def add_selection(dish,quantity,price)
    @selection.store(dish, quantity)
    add_to_total(quantity,price)
    "Dish added!"
  end

  def get_order
    @formatter.format_order(@selection)
  end

  def get_total
    @formatter.format_total(@total)
  end

  private

  def add_to_total(quantity, price)
    @total += (quantity * price)
  end
end
