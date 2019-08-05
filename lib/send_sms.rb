# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'


class Sms
    account_sid = 'AC8cf8ddbfc46fd1a0d2de78e343a47b1b'
    auth_token = 'ef625a66b043aa23d34d30e4978903b2'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+441163260480' # Your Twilio number
    to = '+447856916071' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600)}"
    )
end
