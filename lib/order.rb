class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add(dish, quantity)
    @current_order << [dish, quantity]
  end

end
