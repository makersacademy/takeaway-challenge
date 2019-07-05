require '/Users/student/secret_info/takeaway_info.rb' # top secret!!!!!!!
require 'twilio-ruby'

class TwilioSender

  def initialize

    # put your own credentials here
    account_sid = SID
    auth_token = TOKEN

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  def send(from = TWILIO_NO, to = MY_NO, message)
    @client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
