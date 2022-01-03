require 'rubygems' 
require 'twilio-ruby'

require_relative 'menu'

class Message

  attr_accessor :t

  def initialize
    @t = Time.now + 3600
    account_sid = 'ACf61231921b2a41d935956d471dacf821' 
    auth_token = 'c197c39a8544c160281175cd2dcaf037' 
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    puts "Order confirmed. You'll receive a message with a delivery estimate."
    message = @client.messages.create( 
      body: "Thank you! Your order will be delivered before #{@t.strftime("%R")}.",
      from: 'whatsapp:+14155238886',       
      to: 'whatsapp:+549226251xxxx' 
    ) 

  end

end

