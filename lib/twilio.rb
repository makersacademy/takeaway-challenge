require 'twilio-ruby'

class TextMessage

account_sid = ENV['accsid'] # Your Account SID from www.twilio.com/console
auth_token = ENV['token']   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token


message = @client.messages.create(
    body: "Yo",
    to: ENV['mobile'],    # Replace with your phone number
    from: ENV['tmobile'])  # Replace with your Twilio number

puts message.sid

end
