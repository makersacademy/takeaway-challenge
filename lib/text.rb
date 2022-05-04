require 'rubygems'
require 'twilio-ruby'

class Text
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @phone_number = ENV['PHONE_NUMBER']
  end

  def send_text
    time = Time.new
    time_slot = "#{time.hour + 1}:#{time.min}"
    @client.messages
  .create(
    body: "Thank you! Your order was placed and will be delivered before #{time_slot}",
    from: '+14705184133',
    to: @phone_number
  )
    return "Order placed. Text sent."
  end

end
