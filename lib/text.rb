require 'twilio-ruby'

class Text
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
    @client.messages.create(
      from: "+18186415489",
      to: "+447753410267",
      body: "Thank you! Your order has been placed
      and will be delivered before #{time}")
  end

private

  def time
    time_now = Time.now + (60 * 60)
    time_now.strftime("%I:%M %p")
  end
end
