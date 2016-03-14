require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class Sms
  def initialize
    account_sid = ENV['TWISID']
    auth_token = ENV['TWITOK']

    @client = Twilio::REST::Client.new account_sid, auth_token

    delivery_time = Time.now + 3600
    string_time = delivery_time.strftime('%H:%M')

    @message = @client.messages.create(
      to: ENV['RECEIVER'],
      from: ENV['SENDER'],
      body: "Thank you for your order. It will delivered by #{string_time}"
    )
  end
end
