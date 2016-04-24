class Order
  def initialize menu
    @menu = menu
    @order = []
    @total = 0
  end

  attr_reader :total

  def add dish, quantity
    quantity.times { @order << dish.name }
    add_to_total(dish, quantity)
  end

  def summary
    @order.clone
  end

  private
  def add_to_total dish, quantity
    @total += (@menu.view[dish] * quantity)
  end

end
