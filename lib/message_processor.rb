# messaging class
require 'date'
require 'twilio-ruby'
class MessageProcessor
  def send_message
    account_sid = 'AC316f47470521bb7a1c66213585dde814'
    auth_token = 'b77d5c9768bf346ce88d9a4376dea84e'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441202068032' # Your Twilio number
    to = '+07807795722' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Hey friend!"
    )
  end

end
