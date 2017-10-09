class Order

  attr_reader :current

  def initialize
    @current = {}
  end

  def total
    @current.values.sum
  end

  def summary
    "Thanks! Your order, total £#{total}, will be delivered by #{delivery_time}!"
  end

  def delivery_time
    "#{(Time.now + 1 * 60 * 60).hour}:#{Time.now.min}"
  end

  def sms_confirmation
    # put your own credentials here
    account_sid = 'AC6b680c51845c2d7a21665e16ac1d4ebe'
    auth_token = '62e1ac8639b024c2d19c880a9cc59b6b'
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    # # and then you can create a new client without parameters
    # @client = Twilio::REST::Client.new
    @client.api.account.messages.create(
        from: "+441412806845",
        to: "+447596833699",
        body: "#{order.summary}")

  end
end
