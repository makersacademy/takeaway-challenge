require 'dotenv'
require 'twilio-ruby'
require './lib/hour'

Dotenv.load

module Message
  
  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)

  @from = ENV['TWILIO_NUMBER'] # Your Twilio number
  @to = ENV['MY_NUMBER'] # Your mobile phone number
  @time = Hour.one_ahead
  
  def self.send_confirmation
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you. Your order was placed and will arrive before #{@time}"
    )
  end
end