class Order
  attr_accessor :dish, :quantity, :order

  def initialize
    @dish = ""
    @quantity = 0
    @order = []
  end

  def add_to_order
    quantity.times {order << dish}
  end

end
