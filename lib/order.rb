
# This will be populated with the customer's menu choices and will contain the order total.
class Order
  attr_reader :order, :total

  @@order_count = 0

  def initialize
    @order = []
    @total = 0
    @@order_count += 1
  end

  def order_number
    @@order_count
  end

end
