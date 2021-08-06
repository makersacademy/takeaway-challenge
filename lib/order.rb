class Order
  attr_reader :total_cost

  def initialize
    @dishes = []
    @total_cost = 0
  end
end
