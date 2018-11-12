require 'twilio-ruby'
require 'dotenv'
Dotenv.load('.env')

class Text_sender
ACCOUNT_SID = ENV['ACCOUNT_SID']
AUTH_TOKEN = ENV['AUTH_TOKEN']

  def initialize(client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    @account_sid = ACCOUNT_SID
    @auth_token = AUTH_TOKEN
    @client = client
  end

  def text_confirmation
    @client.messages.create(
    from: ENV["TWILIO_TRIAL_NO"], # twilio number
    to: ENV["MY_PHONE"], # receive number
    body: "Thank you! Your order was placed and will be delivered before" +
          " #{delivery_time}.")
  end

  def delivery_time
    time = Time.now + 3600
    time.strftime("%H:%M")
  end
end