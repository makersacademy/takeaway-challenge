require 'twilio-ruby'
require './config/environments/test'

class TextMessage

  def initialize(recipient = ENV["TO_NUMBER"])
    account_sid = ENV["TWILIO_ACC_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @recipient = recipient
  end

  def send_message
    delviery_time = set_delivery_time
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: ENV["TO_NUMBER"],
        from: ENV["FROM_NUMBER"])
    puts message.sid
  end

  def set_delivery_time
    t = Time.now + 20*60
    "#{t.strftime("%H")}:#{t.strftime("%M")}"
  end

end
