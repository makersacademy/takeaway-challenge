require 'rubygems'
require 'twilio-ruby'

class SendText

  def initialize
    @time = Time.new
    @delivery_time = (@time + 3600).strftime '%H:%M'
  end

  def send
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = @client.messages.create(
      body: "Thank you for your order! It will arrive by #{@delivery_time}.",
      from: '+441205205108',
      to: ENV['PHONE']
    )

    puts message.sid
  end

end
