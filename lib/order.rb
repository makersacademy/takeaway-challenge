# Responsible for collating the order and cost

class Order
  attr_reader :total_cost, :selection

  def initialize(selection)
    @selection = selection
    @total_cost = 0
  end

  def cost_calculator
    total = 0
    @selection.each { |dish| total += dish[:price] }
    @total_cost = total
  end

  def add_to_order(selection)
    selection.each do |dish|
      @selection << dish
    end
  end
end
