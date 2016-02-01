require 'rubygems'
require 'twilio-ruby'

class Message

  attr_reader :client

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
    @client.messages.create(
    from: ENV['TWILIO_NUM'],
    to: ENV['MY_NUM'],
    body: "Thank you! Your order was placed and will be delivered \
    before #{Time.new.hour+1}:#{Time.new.strftime("%M")}"
    )
  end
end
