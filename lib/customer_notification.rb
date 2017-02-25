require 'twilio-ruby'

class CustomerNotification
attr_reader :order, :customer
  def initialize(customer, order, client)
    @customer = customer
    @order = order
    @client = client
    @sent = false
  end

  def notify
    @client.notify("Thank you for your order #{@customer.name}!
    It will be delivered before #{(@order.time_placed + (60 * 60)).strftime('%r')}")
    @sent = true
  end

  def sent?
    @sent
  end

end
