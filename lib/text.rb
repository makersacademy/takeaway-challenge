class Text

def send(message)
  require 'twilio-ruby'

  # put your own credentials here
  account_sid = '*'
  auth_token = '*'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
    from: '+*',
    to: '+*',
    body: message
  )
end

end
