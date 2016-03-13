require 'twilio-ruby'

class Sms
  def initialize
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    delivery_time = Time.now + 3600
    string_time = delivery_time.strftime('%H:%M')

    @message = @client.messages.create(
      to: ENV['FROM'],
      from: ENV['TO'],
      body: "Thank you for your order. It will delivered by #{string_time} "
    )
  end
end
