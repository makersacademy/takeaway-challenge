require 'twilio-ruby'

account_sid = ENV['MY_TWILIO_ACCOUNT_SID']
auth_token =  ENV['MY_TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60).strftime("%H:%M")}",
    to: ENV['MY_MOBILE'],
    from: ENV['MY_TWILIO_NUMBER'])

puts message.sid
