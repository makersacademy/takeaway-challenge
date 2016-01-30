require 'twilio-ruby'
require 'dotenv'

class Text
  attr_reader :send_confirmation

  def initialize
    @credentials = Dotenv.load('dotenv.env')
  end

  def send_confirmation(body)
    # put your own credentials here
    account_sid = @credentials["account_sid"]
    auth_token = @credentials["auth_token"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441442796264',
    	:to => '+447931642696',
      :body => body
    })
  end
end
