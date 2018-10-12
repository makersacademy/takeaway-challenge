class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add_to_order(dish, quantity)
    @order << [dish, quantity]
    return "#{dish.capitalize} x#{quantity}"
  end

end
