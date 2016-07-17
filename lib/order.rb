class Order
  attr_accessor :dish, :quantity, :order

  def initialize(dish = nil,quantity = nil )
    @dish = dish
    @quantity = quantity
    @order = []
  end

  def add_to_order
    quantity.times {order << dish}
  end

end
