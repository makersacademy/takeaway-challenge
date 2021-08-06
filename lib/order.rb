class Order
  attr_reader :total_cost, :selection

  def initialize(selection)
    @selection = selection
    @total_cost = 0
  end

  def cost_calculator
    @selection.each do |dish|
      @total_cost += dish[:price]
    end
  end

  def add_to_order(selection)
    selection.each do |dish|
      @selection << dish
    end
  end
end
