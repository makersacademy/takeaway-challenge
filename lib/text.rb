require 'twilio-ruby'
require 'dotenv'
Dotenv.load('hidden_data.env')

class Text

  def initialize(twilio_rest_client = Twilio::REST::Client, env = ENV)
    @account_sid = env["TWILIO_ACCOUNT_SID"]
    @auth_token = env["TWILIO_AUTH_TOKEN"]
    @client = twilio_rest_client.new(@account_sid, @auth_token)
  end

  def send(env = ENV)
    @client.messages.create(
      from: env["TWILIO_PHONE_NUMBER"],
      to: env["MY_PHONE_NUMBER"],
      body: 'Your order will arrive in an hour'
    )
  end

end
