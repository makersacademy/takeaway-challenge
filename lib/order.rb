# understand what the customer wants and the status of the order

class Order

  attr_reader :sum, :list, :status

  def initialize
    @status = nil
    @list = []
    @sum = 0
  end

  def start_order(customer_order)
    @sum = customer_order.sum
    @list = customer_order.list
    @status = "Checking sum"
  end

  def confirm_order
    @status = "Confirmed"
  end

  # Do I need the following?
  # need a method here to check prices and set status to "in progress"
  # need to pass back a confirmation to the Restaurant

end
