class Message

  def initialize

  end

def send_message

require 'twilio-ruby'

account_sid = "ACcb5ae070e747000551a62bb95de8eb9e" # Your Account SID from www.twilio.com/console
auth_token = "ce6bdf9ccd96d45faf12ba57ac332aea"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "your order was placed !",
    to: "+447480978178",    # Replace with your phone number
    from: "+441743562182 ")  # Replace with your Twilio number

puts message.sid

end

end
