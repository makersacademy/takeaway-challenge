class Order
  attr_accessor :order, :quantity

  def initialize
    @order = 0
    @quantity = 0
  end

  def add_to_order(order, quantity = 1)
    @order = order
    @quantity = quantity
    basket
  end

  def basket
    "You added #{@quantity}x #{@order}(s) to the basket"
  end

end
