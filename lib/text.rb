require 'rubygems'
require 'twilio-ruby'

class Text

  def send_sms
    # credentials hidden
    account_sid = 'AC8...'
    auth_token = 'd20...'
    # setting up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
         body: 'Your order was placed and will be delivered within one hour',
         from: '+4477...',
         to: '+4477...'
       )

  end

end
