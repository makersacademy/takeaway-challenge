require 'twilio-ruby'
require 'dotenv'
require 'dotenv/load'

class Message
  def send
    
    account_sid = ENV['TWILLIO_ACCOUNT_SID']
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    # Initialize Twilio Client
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    time = Time.now + 3600

    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}",
        to: ENV["MY_PHONE_NUMBER"],
        from: "+447480534690")

    puts message.sid

  end
end