require 'twilio-ruby'

account_sid = "AC5c6b2c48f344a0423a8c86c4b306dd19"
auth_token = "235b24a9a61ca4cadd5eb2138d91dbc2"

@client = Twilio::REST::Client.new account_sid, auth_token

def send_message
  message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before 18:52",
      to: "+447808268974",
      from: "+12055709378")
  puts message.sid
end
