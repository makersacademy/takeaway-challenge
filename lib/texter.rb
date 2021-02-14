require 'rubygems'
require 'twilio-ruby'

class Texter
  # note - these should be environment variables
  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send
    @client.messages.create(
      # note - this should be an environment variable
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
    return :message_sent
  end

  private

  def time
    time = Time.now + (60 * 60)
    time.strftime("%H:%M")
  end
end
