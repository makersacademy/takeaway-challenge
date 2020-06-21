class Order

  attr_reader :order, :order_number

  def initialize(order)
    @order = order
  end
end

# create order total @ initialize
# create method in takeaway to recall what the total was
