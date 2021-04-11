require 'dotenv/load'
require 'twilio-ruby'

class MessageSender

  def initialize(from = ENV['TWILIO_FROM_PHONE_NUMBER'])
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @twilio_client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = from
  end

  def send_message(to, text = "Thank you! Your order was placed and will be delivered in 30 minutes")
    begin
      @twilio_client.messages.create(
        from: @from,
        to: to,
        body: text
        )
    rescue StandardError
      puts "An error occurs while sending the message to #{to}"
    end
  end
end
