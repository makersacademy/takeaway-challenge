require './lib/takeaway'

class Order

  attr_reader :order

  def initialize
    @order = {}
    @menu = {"Margherita" => 8.95, "Hawaiian" => 9.95, "Vegetarian" => 9.95,
      "Pepperoni" => 10.95, "BBQ Chicken" => 10.95,
      "Coke" => 1.95, "Diet Coke" => 1.85, "Water" => 1.00}
  end

  def add(item)
    if @order[item] == nil
      @order[item] = 1
    else
      count = @order[item]
      @order[item] = count + 1
    end
    self
  end

  def total_cost
    @cost_calculator = 0
    cost_calculator_hash = Hash[ @order.map {|key, value| [key, (value.to_f * @menu[key].to_f)]}]
    cost_calculator_hash.each do |key, value|
      @cost_calculator += value
    end
    @cost_calculator
  end

end
