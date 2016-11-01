require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message
  def initialize
  end


  def send_text
    account_sid = ENV['ACCOUNT_SID']

    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
    to: ENV['NUMBER_TO'],
    from: ENV['NUMBER_FROM'],
    body: "Thank you! Your order was placed and will be delivered before #{@time_in_hour}."
    )
  end

  def time
    time = Time.new
    @time_in_hour = time + (60 * 60)
    @time_in_hour
  end
end

message = Message.new
p message.time
