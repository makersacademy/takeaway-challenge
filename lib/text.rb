require 'twilio-ruby'
require 'dotenv'

class Text
  attr_reader :send_confirmation

  def initialize
    @credentials = Dotenv.load
  end

  def send_confirmation(body)
    # put your own credentials here
    @credentials[account_sid]
    @credetin[auth_token] 

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441442796264',
    	:to => '+447931642696',
      :body => body
    })
  end
end
