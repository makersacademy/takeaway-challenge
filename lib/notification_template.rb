require 'twilio-ruby'

class Notification
  def initialize(client = Twilio::REST::Client)
    @client = client.new(ACCOUNT_SID, AUTH_TOKEN)
  end
  ACCOUNT_SID = 'xxxxxxxxxxxxxxxxxxx'
  AUTH_TOKEN = 'xxxxxxxxxxxxxxxxxxx'

  FROM = '+111111111111' # Your Twilio number
  TO = '+111111111111' # Your mobile phone number

  def send(delivery_time)
    @client.messages.create(
    from: FROM,
    to: TO,
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end
end
