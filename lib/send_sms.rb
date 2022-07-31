# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'dotenv/load'
require 'twilio-ruby'

class SMS

  attr_reader :account_sid, :auth_token, :from, :to, :time

  def initialize
    @account_sid = ENV["ACCOUNT_SID"]
    @auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @time = Time.new + 3600
    @delivery_time = @time.strftime("%k:%M")
    @from = ENV["TWILIO_MOBILE"] # Your Twilio number
    @to = ENV["MY_MOBILE"] # Your mobile phone number
  end

  def send_sms
    @client.messages.create(
    from: @from,
    to: @to,
    body: 
    "
    Thank you! Your order was placed and will be delivered before #{@delivery_time}
    "
    )
  end

end
