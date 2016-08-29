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

end
