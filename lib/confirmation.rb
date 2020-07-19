require 'twilio-ruby'
require 'dotenv'



class Confirmation

  def place_order
    Dotenv.load

    time = Time.now + 60 * 60
    time = time.strftime("at %I:%M %p")

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(


    body: "Your takeaway order is confirmed! It will arrive at #{time}",



    to: ENV["TWILIO_MY_PHONE"],
    from: ENV["TWILIO_PHONE"])
    puts message.sid
  end
end
