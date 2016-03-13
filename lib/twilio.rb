require 'twilio-ruby'

def send_message(delivery_time)

  account_sid = ENV['TWILIO_ACC']
  auth_token = ENV['TWILIO_AUTH']

  @client = Twilio::REST::Client.new account_sid, auth_token
  @message = @client.messages.create(
    to: "+447460860474",
    from: "+441580392070",
    body: "Thank you! Your order will be delivered before #{delivery_time}."
  )
end
