class Order

  def initialize
    @trolley = []
    @cost = 0
  end

  def take_order(an_order, quantity = 1)
    quantity.times {trolley << an_order}
    ammend_total_cost
  end

  def check_order
    trolley.dup
  end

  def total_cost
    total = cost.round(2).to_s
  end

  private

  attr_reader :trolley, :cost

  def ammend_total_cost
    @cost = 0
    trolley.each { |order| order.each_value {|v| @cost += v.to_f} }
  end

end