require './lib/takeaway'

class Order

  attr_reader :order

  @menu = {"Margherita" => 8.95, "Hawaiian" => 9.95, "Vegetarian" => 9.95,
    "Pepperoni" => 10.95, "BBQ Chicken" => 10.95,
    "Coke" => 1.95, "Diet Coke" => 1.85, "Water" => 1.00}

  def initialize
    @order = {}
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

  end

end
