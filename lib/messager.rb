require 'dotenv/load'
require 'twilio-ruby'

class Messager

  def initialize
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(total)
    time = Time.now + (60 * 60)
    @client.messages.create(
      body: "Your order is on it's way! Your total is $#{total} and it should arrive before #{time.strftime("%R")}.",
      to: ENV['MY_PHONE'],
      from: ENV['TWILIO_PHONE'])
    return "Text sent!"
  end

end
