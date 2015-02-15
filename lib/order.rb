class Order

  DEFAULT_MAXIMUM = 10

  attr_accessor :orders, :count, :total

  def initialize(options = {})
    @maximum_order = options.fetch(:maximum_order, maximum_order)
    @orders = {}
    @count = 0
    @total = 0
  end

  def maximum_order
    @maximum_order ||= DEFAULT_MAXIMUM
  end

  def add_cereal(cereal, amount)
    # raise 'Maximum order exceeded' if full?
    @orders[cereal] = amount
  end

  # def full?
  #   item_count == maximum_order
  # end

  # def item_count
  #   @orders.count
  # end

  def item_count
    orders.map {|dish, amount| @count += amount}
    @count
  end

  def order_total
    orders.map {|dish, amount| @total += (dish.price * amount)}
    @total
  end
  
end