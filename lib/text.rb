require 'twilio-ruby'

class Text
  def initialize(client: nil)
    @client = client
  end

  def confirmation(price)
    account_sid = ENV["TWILIO_ACC_SID"]
    auth_token = ENV["TWILIO_AUTH"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    from = ENV["TWILIO_NUM"]
    to = ENV["MY_NUM"]
    time = Time.new
    @client.messages.create(from: from, to: to,
      body: "Thank you for your order. Total cost: £#{price}.
      Your order will be delivered before #{time.hour + 1}:#{time.min}.")
  end
end
