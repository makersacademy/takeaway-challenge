require 'twilio-ruby'
require 'dotenv/load'

class MessageSender
  def initialize
    @acc_sid = ENV['ACC_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new @acc_sid, @auth_token
  end

  def send_sms(msg, num)
    message = @client.messages.create(
    body: msg,
    to: num,
    from: "441765522063")
  end
end
