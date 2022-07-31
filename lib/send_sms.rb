require 'twilio-ruby'
require 'time'
class Messenger
  def initialize()
    @account_sid =
    @auth_token = ''
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = '+447445034137' # Your Twilio number
    @to = '' # Your mobile phone number
  end

  def send
    delivery_time = (Time.now + 1*60*60).strftime("%H:%M")
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Order Placed 🍲🤯 It will arrive at #{delivery_time}"
    )
  end
end
