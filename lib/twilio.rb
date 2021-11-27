require 'twilio-ruby'

class Twilio

def intialize 
  account_sid = 'AC28b51837d71f1dc049a2ad0614d3b25f'
  auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
  client = Twilio::REST::Client.new(account_sid, auth_token)
end

def confirmation_message

    from = '+15551234567' # Your Twilio number
    to = '+15555555555' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Hey friend!"
    )
end













end