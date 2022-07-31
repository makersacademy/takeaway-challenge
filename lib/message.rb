require 'rubygems' 
require 'twilio-ruby'

require_relative 'menu'

class Message

  attr_accessor :t

  def initialize
    @t = Time.now + 3600
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    puts "Order confirmed. You'll receive a message with a delivery estimate."
    message = @client.messages.create( 
      body: "Thank you! Your order will be delivered before #{@t.strftime("%R")}.",
      from: 'whatsapp:+14155238886',       
      to: ENV['TWILIO_PHONE_NUMBER']
    ) 

  end

end

