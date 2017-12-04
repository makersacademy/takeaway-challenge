require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class Text

  def initialize(time_class = Time)
    @time_class = time_class
  end

  def send_text (twilio_rest_client = Twilio::REST::Client, env = ENV)
    account_sid = env["TWILIO_SID"]
    auth_token = env["TWILIO_AUTH"]

    @client = twilio_rest_client.new(account_sid, auth_token)

    message = @client.messages.create(to: env["PHONE_NUMBER"], from: env["TWILIO_NUMBER"], body: "Thank you! Your order was placed and will be delivered before #{time_plus_one}")
  end

  def time_plus_one
    (@time_class.now + 3600).strftime("%H:%M")
  end

end
