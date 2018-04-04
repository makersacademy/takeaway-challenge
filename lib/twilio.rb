require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message
  attr_reader :from, :to, :body

  def initialize(_client = nil)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    customer = ENV['CUSTOMER']
    twilio = ENV['TWILIO']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    @client.messages.create(
       body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}",
       to: 'customer',
       from: 'twilio'
     )
  end
end
