require 'rubygems'
require 'twilio-ruby'

class Messenger
  account_sid = "ACCOUNT_SID"
  auth_token = "AUTH_TOKEN"

  @client = Twilio::REST::Client.new account_sid, auth_token
  @time = (Time.now + (60*60)).strftime("%H:%M")

  def send_text
    @client.messages.create(
        to: "MOBILE_NUMBER",
      from: "TWILIO_NUMBER",
      body: "Thank you! Your order was placed and will be delivered before #{@time}.")
  end
end
