require 'twilio-ruby'
require 'dotenv'
Dotenv.load('hidden_data.env')

class Text

  def initialize(twilio_rest_client = Twilio::REST::Client)
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = twilio_rest_client.new(@account_sid, @auth_token)
  end

  def send
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: ENV["MY_PHONE_NUMBER"],
      body: 'Your order will arrive in an hour'
    )
  end

end
