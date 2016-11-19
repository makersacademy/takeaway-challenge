# Manage the orders of the customer

class OrderManager

  attr_accessor :order

def initialize
  @order
end

def submit_order(order)
  @order = order
end




end
