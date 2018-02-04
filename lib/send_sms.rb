require 'twilio-ruby'
require 'dotenv'
Dotenv.load('encrypted.env')

class Text

  def initialize(twilio_rest_client = Twilio::REST::Client, env = ENV)
    @account_sid = env["TWILIO_ACCOUNT_SID"]
    @auth_token = env["TWILIO_AUTH_TOKEN"]
    @client = twilio_rest_client.new(@account_sid, @auth_token)
  end

  def send_text(env = ENV)
    @client.messages.create(
      from: env["TWILIO_PHONE_NUMBER"],
      to: env["MY_PHONE_NUMBER"],
      body: "Thanks, your order has been set will arrive at #{time_in_an_hour}"
    )
  end

end
