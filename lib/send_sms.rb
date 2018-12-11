require 'twilio-ruby'
require('Bundler')

class Sendsms
  def create_message
    account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+987654321' # Your Twilio number
    to = '+123456789' # Your mobile phone number
    time = Time.now.getlocal('+01:00')

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time}!"
    )
  end
end
