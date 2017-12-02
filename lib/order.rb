class Order
  attr_accessor :order
  DEFAULT_QUANTITY = 1

  def initialize
    @order = {}
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    @order.include?(item) ? @order[item] += quantity : @order[item] = quantity
  end
end
