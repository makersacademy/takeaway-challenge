require 'twilio-ruby'

require 'dotenv'
Dotenv.load

# put your own credentials here
account_sid = ENV['SID']
auth_token = ENV['TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# myLogger = Logger.new(STDOUT)
# myLogger.level = Logger::DEBUG
# @client.logger = myLogger

def test
  @client.messages.create(
    from: ENV['TWILIO_NUM'],
    to: ENV['ALEX_NUM'],
    body: 'Hey there!'
  )
end
