class OrderList
  attr_reader :orders
  def initialize
    @orders = []
  end

  def show_orders
    orders
  end

  def store_order(order)
    @orders << order
  end
end
