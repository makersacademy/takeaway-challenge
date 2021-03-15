require 'dotenv/load'
require 'twilio-ruby'

class Message
  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def sms(phone_number)
    time = Time.new + 3600
    @client.messages.create(
      body: "Your order is being processed you can expect delivery by #{time.hour}:#{time.min}",
      to: phone_number,
      from: ENV['ACCOUNT_NUMBER'])
  end
end
