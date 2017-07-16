require 'twilio-ruby'

class TextSender
  def initialize
    account_sid = ENV["TWILIO_TEST_SID"]
    auth_token = ENV["TWILIO_TEST_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def text
    message = "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    @client.api.account.messages.create(
      from: '+15005550006',
      to: ENV["MY_PHONE_NO"],
      body: message
    )
  end
end
