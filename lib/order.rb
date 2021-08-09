# Responsible for collating the order and cost

class Order
  attr_reader :total_cost
  attr_accessor :selection

  def initialize
    @selection = []
    @total_cost = cost_calculator
    # @placed = false
  end

  def cost_calculator
    total = 0
    @selection.each { |dish| total += dish[1] }
    @total_cost = total
  end

  def add_to_order(selection)
    @selection << selection
    cost_calculator
  end

  # complete and confirm - send confirmation.
end
