require 'dotenv'
Dotenv.load('takeaway.env')
require 'twilio-ruby'

class Text

  def initialize
    # put your own credentials here
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end


  def send(message)
    @client.api.account.messages.create({
      from: ['TWILIO_TRIAL_NUMBER'],
      to: ['MOBILE'],
      body: message
    })
  end

end