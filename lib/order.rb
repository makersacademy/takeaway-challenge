class Order

  attr_reader :customer, :order_details

  def initialize customer, order_details
    @customer = customer
    @order_details = order_details
  end

end
