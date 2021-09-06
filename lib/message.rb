require 'rubygems'
require 'twilio-ruby'

class Message

  def send_message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      messaging_service_sid: ENV['MESSAGING_SERVICE_SID'],
      body: "Your order is confirmed and it will arrive at #{one_hour}",
      to: ENV['MY_NUM']
    )
  end

  def one_hour
    (Time.now + 60 * 60).strftime("%I:%M %p")
  end
end
