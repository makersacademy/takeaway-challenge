# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Send_sms
  def initialize
    account_sid = 'AC109ba1fda5f9f709d7a80f14c62cb903'
    auth_token = '2d6aed4a89267db9c6048a30fe270923'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from =  '+447723451767'# Your Twilio number
    to =  '+447521393921'# Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end
