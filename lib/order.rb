class Order

  DEFAULT_MAXIMUM = 10

  attr_accessor :orders

  def initialize(options = {})
    maximum_order = options.fetch(:maximum_order, maximum_order)
    @orders = {}
  end

  def maximum_order
    @maximum_order ||= DEFAULT_MAXIMUM
  end

  def add_cereal(cereal, quantity)
    @orders[cereal] = 1
  end

  def order_count
    @orders.count
  end
  
end