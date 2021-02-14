require 'dotenv/load'
require 'twilio-ruby'

class Sms

  def send_text
    time = Time.new + 1800 #adds 30 minutes
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Thanks! Your order will arrive at #{time.strftime("at %I:%M%p")}",
    to: ENV["PHONE_NUMBER"],
    from: "+447476562986")

    puts message.sid
  end
end
