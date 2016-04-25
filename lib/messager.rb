require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messager

  def send
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['AUTH_TOKEN']
    @client.account.messages.create(
    from: ENV['FROM'],
    to: ENV['TO'],
    body: "Order confirmed"
   )
   end
end