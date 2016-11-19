class Order

  attr_reader :customer_info, :order

  def initialize( customer, *order )
    @customer_info = customer
    @order = order
  end

end
