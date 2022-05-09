class CustomerOrder

  attr_reader :order

  def initialize
    @order = []
  end

  def order_maker
  end
  
  def total
    order_total = @order.values.sum
  end
end