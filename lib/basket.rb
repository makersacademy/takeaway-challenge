# understands orders

class Basket
  attr_reader :current_order, :total_cost

  def initialize
    @current_order = []
    @total_cost = 0
  end

  def add(item)
    @total_cost += ('%.2f' % item.values.join).to_f
    @current_order.push(item)
  end

end
