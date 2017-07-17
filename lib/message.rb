require 'twilio-ruby'

class Message

  def send_message
    account_sid = ENV["MY_AC_SID"]
    auth_token = ENV["MY_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Thank you! Your order will arrive within 1 hour.",
    to: ENV["MY_PHONE_NO"],
    from: ENV["MY_TWILIO_NO"])
    puts message.sid
  end

end
