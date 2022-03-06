require 'rubygems'
require 'twilio-ruby'
require 'time'

class SMS
  def client
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms
    arrival_time = (Time.now + 60 * 60).strftime("%H:%M")

    client.messages.create(
      from: +166_266_786_74,
      to: ENV["PHONE"],
      body: "Thank you! Your order was placed and will arrive by #{arrival_time}"
    )
  end
end
