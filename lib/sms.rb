require 'twilio-ruby'
require 'dotenv/load'

class Sms

  def initialize
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms
    message = @client.messages.create(
     body: "Thank you! Your order was placed and will be delivered
     before #{(Time.now + 60 * 60).strftime("%H:%M")}",
     to: ENV["TO_MOBILE"],
     from: ENV["FROM_MOBILE"])
     puts message.sid
  end
end
