require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class SMS
account_sid = ENV['ACCOUNT_SID']
aut_token = ENV['AUTH_TOKEN']

def initialize(@client = Twilio::REST:Client.new(account_sid, auth_token))

@message = @client.messages.create(
  to: ENV['MY_NUMBER']
  from: "+441329801041"
  body: "hi cake eater, order on way"
)

end
