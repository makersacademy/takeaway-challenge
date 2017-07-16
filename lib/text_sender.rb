require 'twilio-ruby'

class TextSender
  def initialize
    account_sid = ENV["TWILIO_LIVE_SID"]
    auth_token = ENV["TWILIO_LIVE_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def text
    @client.api.account.messages.create(
      from: ENV["TWILIO_FROM_NO"],
      to: ENV["MY_PHONE_NO"],
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end
end
