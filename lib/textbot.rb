require 'twilio-ruby'
require_relative 'twiliodetails'

class Textbot
  def initialize
    account_sid = Twilio::ACCOUNT_SID
    auth_token = Twilio::AUTH_TOKEN
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def sendmessage(amount, client = @client)
    time = Time.new
    message = client.messages.create(
    body: "Your order is on the way! It will be delivered by #{time.hour + 1}:#{time.min}. Total: £#{amount}",
    to: "+447825794393",
    from: "+441315104045")
    puts
  end
end
