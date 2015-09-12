class Customer
  attr_reader :order

  def place_order(orderklass = Order)
    @order = orderklass.new
  end
end
