require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messenger
  def initialize
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message_config = {
    to: ENV['MY_NUM'],
    from: ENV['TWILIO_NUM'],
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now + (3600)).strftime("%R")}."}
  end

  def send_message
    @client.messages.create(@message_config)
  end
end
