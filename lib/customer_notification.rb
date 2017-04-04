class CustomerNotification

  attr_reader :customer, :order, :client

  def initialize(customer, order)
    @customer = customer
    @order = order
    @client = customer.method
    @sent = false
  end

  def notify
    @client.notify("Thank you for your order #{@customer.name}! It will be delivered before #{(@order.time_placed + (60 * 60)).strftime('%r')}
    Here is a summary:
    #{@order.print_order}")
    @sent = true
  end

  def sent?
    @sent
  end

end
