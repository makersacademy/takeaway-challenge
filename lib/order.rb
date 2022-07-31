class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_item(item)
    @current_order << item
  end

  def remove_item(item)
    @current_order.delete(item)
  end

  def print_order
    print @current_order
  end

  def check_out
    print "You have ordered #{@current_order.size} dishes at #{total_cost}"
  end

  def total_cost
    @current_order.map { |dish| dish.values.split("£").join.to_i }.inject(&:+)
  end
end
