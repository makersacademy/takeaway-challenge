require_relative 'request'

class Sms

  CONFIRMATION_MESSAGE = "Thank you! Your order was placed and will be delivered before"
  ORDER_KEYWORD = 'ORDER'
  def initialize(client: nil, number: nil, request_class: Request)
    @client = client
    @from = number
    @request_class = request_class
  end

  def send_message(customer:nil, delivery_time:nil)
    @client.account.messages.create(
        :from => @from,
        :to => customer.mobile,
        :body => "#{CONFIRMATION_MESSAGE} #{delivery_time}"
    )
  end

  def get_messages
    requests = []
    @client.account.messages.list.each do |message|
      if message.from != @from && !message.body.match(/^#{ORDER_KEYWORD}/).nil?
        body = message.body.to_s
        body = body.match(/^#{ORDER_KEYWORD}\s+([a-z0-9\s\,]+$)/).captures[0]
        request = @request_class.new(
          channel: 'sms',
          from: message.from,
          body: body,
          datetime: message.date_sent
        )
        requests << request
      end
    end
    requests
  end
end
