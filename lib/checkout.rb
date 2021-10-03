require 'dotenv/load'
require 'twilio-ruby'

class Checkout

  def initialize
    @time = Time.now + 3600
  end

  def send_notification
    account_sid = ENV['SID'] # Your Test Account SID from www.twilio.com/console/settings
    auth_token = ENV['TOKEN']   # Your Test Auth Token from www.twilio.com/console/settings

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_NUM"] # Your Twilio number
    to = ENV["MY_NUM"] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%k:%M")}"
    )
  end 
end