class Shop
  attr_reader :orders
  def initialize
    @orders = {}
  end

  def take_order(order, user)
    @orders[(total_orders + 1)] = { order: order, user: user }
  end

  def total_orders
    orders.size
  end
end
