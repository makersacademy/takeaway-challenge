require 'twilio-ruby'

# for managing sid, api, and phone numbers
require 'dotenv'
Dotenv.load

class SMS

  def initialize
    # put your own credentials here
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(msg)
    @client.messages.create(
      from: ENV['RESTAURANT_NUM'],
      to: ENV['CUSTOMER_NUM'],
      body: msg
    )
  end

end
