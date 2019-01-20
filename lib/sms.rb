require "twilio-ruby"

class Sms
  TIME_FORMAT = "%H:%M"
  attr_reader :account_sid, :auth_token, :client, :receipt

  def initialize(receipt)
    @account_sid = "ACdbea4f7fe81e307ec38fa38334d78d9a" # Your Account SID from www.twilio.com/console
    @auth_token = "7f094497b914562353e9623175bb302e"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
    @receipt = receipt
  end

  def send
    client.messages.create(message_contents)
  end

  def message_contents
    {
      body: "#{receipt} \n Thank you! Your order will be delivered before #{delivery_time}",
      to: "Removed",    # Replace with your phone number
      from: "Removed"  # Replace with your Twilio number
    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
