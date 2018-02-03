require_relative "order"

class Menu

  attr_reader :dishes, :order

  def initialize(order = Order.new)
    @order = order
  end

  def show
    @dishes = { "sweet and sour tofu" => 5,
      "singapore noodles" => 3,
      "szechuan tofu" => 5,
      "rice" => 1 }
  end

  def place_order(dish, quantity)
    @order.dish_quantity(dish, quantity)
  end

  def total
    @order.calculate_total
  end
end
