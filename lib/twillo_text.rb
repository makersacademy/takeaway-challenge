require 'twilio-ruby'
require 'dotenv/load'
require 'rubygems'

class SendMessage
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @recipient_phone = ENV['Recipient_phone']
    @twilio_number = ENV['Twilio_number']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_customer_message
    message_content = @client.messages.create(
      from: @twilio_number,
      to: @recipient_phone,
      body: "Thank you! Your order was placed and will be delivered before
        #{Time.now.strftime("%d/%m/%Y %H:%M")}"
    )
    puts message_content.sid
    # unique id
  end
end
