require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Confirmation

  def send_sms
    (account_sid = ENV['TWILIO_ACCOUNT_SID'])
    (auth_token = ENV['TWILIO_AUTH_TOKEN'])

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: ENV['TWILIO_NO'],
      to: ENV['MY_NO'],
      body: "Thank you! Your order will be delivered before #{delivery_time}"
    )
  end

  private

  def delivery_time
    t = Time.new + 3600
    t.strftime("%I:%M%p")
  end

end
