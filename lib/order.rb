# understand what the customer wants and the status of the order

class Order

  attr_reader :sum, :list, :status

  def initialize
    @status = nil
    @list = []
    @sum = 0
  end

  def start_order(list, sum)
    @list.push(list)
    @sum += sum
    @status = "Checking sum"
  end

  def confirm_order
    @status = "Confirmed"
  end

  # Do I need the following?
  # need a method here to check prices and set status to "in progress"
  # need to pass back a confirmation to the Restaurant

end
