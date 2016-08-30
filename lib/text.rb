class Text

def send(message)
  require 'twilio-ruby'

  account_sid = '*'
  auth_token = '*'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
    from: '+*',
    to: '+*',
    body: message
  )
end

end
