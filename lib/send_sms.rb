# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require ''

class Send_sms
  def initialize
    account_sid =
    auth_token =
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from =  '+447723451767'# Your Twilio number
    to =  '+44'# Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end
