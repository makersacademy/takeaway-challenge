class Order
  attr_reader :total

  def initialize(order_details, total)
    @dishes = order_details
    @total  = total
  end

  def summary
    @dishes[:total] = @total
    @dishes.clone.freeze
  end
end
