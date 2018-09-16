class OrderList
  attr_reader :orders
  def initialize
    @total = 0
    @orders = []
  end

  def show_orders
    orders
  end

  def store_order(order)
    @orders << order
  end

  def stringify_cost
    reset_total
    calculate_cost
    "£%.2f" % total
  end

  private
  attr_reader :total

  def reset_total
    @total = 0
  end

  def calculate_cost
    newarr = []
    orders.each do |dish|
      dish.each { |k, v| newarr << v if k == :price }
    end
    @total = newarr.reduce(:+)
  end
end
