# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Delivery
  def send_message(order_number)
    account_sid = '~'
    auth_token = '~'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+~' # Your Twilio number
    to = '+~' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order! Order: #{order_number} was placed at #{Time.now.strftime('%X')} and will be delivered in the next 60 minutes "
    )
  end
end
