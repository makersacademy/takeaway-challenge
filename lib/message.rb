require 'twilio-ruby'
require 'dotenv/load'

class Message

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    @client.messages.create(
      from: ENV['FROM'],
      to:  ENV['TO'],
      body: "Thank you! Your order was placed and will be delivered before
      #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end
end
