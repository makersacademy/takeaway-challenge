class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_dish(dish, quantity)
    current_order << {dish: dish, quantity: quantity}
  end




end
