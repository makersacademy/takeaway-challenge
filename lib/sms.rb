require 'twilio-ruby'

class SMS
account_sid = ENV['ACCOUNT_SID']
aut_token = ENV['AUTH_TOKEN']

def initialize(@client = Twilio::REST:Client.new(account_sid, auth_token))

@message = @client.messages.create(
  to: "07894225056"
  from:
  body: "hi cake eater, order on way"
)

end 
