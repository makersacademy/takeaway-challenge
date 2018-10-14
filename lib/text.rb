require 'rubygems'
require 'twilio-ruby'

class Text
    # credentials hidden
    account_sid = 'AC86bdxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'd20a9dxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    # setting up a client to talk to the Twilio REST API
    CLIENT = Twilio::REST::Client.new(account_sid, auth_token)
    FROM = '+441xxxxxxxxx'
    TO = '+447xxxxxxxxx'

  def send_sms
    CLIENT.messages.create(
         body: 'Your order was placed and will be delivered within one hour',
         from: FROM,
         to: TO)
  end

end
