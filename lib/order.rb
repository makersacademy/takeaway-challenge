class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_dish(dish, quantity)
    raise "You must enter an integer that is at least 1" if invalid_quantity?(quantity)
    current_order << {dish: dish, quantity: quantity}
  end

  def total_cost
    total = 0
    current_order.each { |order| total += order[:dish].price * order[:quantity] }
    total
  end

  private

  def invalid_quantity?(quantity)
   !(quantity.is_a? Integer) || quantity == 0
  end

end
