require_relative "menu"

class Order

  attr_reader :total, :items

  def initialize
    @total = []
    @dishes = { "sweet and sour tofu" => 5,
      "singapore noodles" => 3,
      "szechuan tofu" => 5,
      "rice" => 1 }
  end

  def dish_quantity(dish, quantity)
    @items = @dishes.values_at(dish)
    @items << quantity.to_i
    @total << @items.inject(:*)
  end

  def calculate_total
    @total.inject(:+)
  end
end
