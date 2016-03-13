require 'twilio-ruby'

account_sid = ENV['TWILIO_ACC']
auth_token = ENV['TWILIO_AUTH']

@client = Twilio::REST::Client.new account_sid, auth_token

def send_message(delivery_time)
  @message = @client.messages.create(
    to: "+447460860474",
    from: "+15555555555",
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  )
end
