require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def deliver_message

    account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
    auth_token = ENV['TWILIO_ACCOUNT_AUTH'] # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}",
        to: ENV['TO'], # Replace with your phone number
        from: ENV['FROM']) # Replace with your Twilio number

    puts message.sid

  end

end
