class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_dish(dish, quantity)
    raise "You must enter an integer that is at least 1" if invalid_quantity?(quantity)
    current_order << {dish: dish, quantity: quantity}
  end

  def total_price
    return 0 if current_order.empty?
    13.5
  end

  def invalid_quantity?(quantity)
   !(quantity.is_a? Integer) || quantity == 0
  end



end
