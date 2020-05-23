class Order

  attr_reader :selection, :total

  def initialize
    @selection = {}
    @total = 0
  end

  def add_selection(dish,quantity,price)
    @selection.store(dish, quantity)
    add_to_total(quantity,price)
    "Dish added!"
  end

  private

  def add_to_total(quantity, price)
    @total += (quantity * price)
  end
end
