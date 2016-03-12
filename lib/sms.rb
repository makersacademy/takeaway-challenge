class Sms

  CONFIRMATION_MESSAGE = "Thank you! Your order was placed and will be delivered before"

  def initialize(client: nil, number: nil)
    @client = client
    @from = number
  end

  def send_message(customer:nil, delivery_time:nil)
    @client.account.messages.create(
        :from => @from,
        :to => customer.mobile,
        :body => "#{CONFIRMATION_MESSAGE} #{delivery_time}"
        )
  end
end
