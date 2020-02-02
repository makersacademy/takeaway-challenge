require 'twilio-ruby'

class Message
  def send(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_NUMBER'] 
    to = ENV['MY_NUMBER'] 

    client.messages.create(
    from: from,
    to: to,
    body: "Hey friend!"
    )
    return message
  end
end
