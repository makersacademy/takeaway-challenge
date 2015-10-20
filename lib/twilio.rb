require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class TwilioAPI
  def send_sms(payment)
    # put your own credentials here, get them at twilio.com
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: ENV['TWILIO'],
      to: ENV['NUMBER'],
      body: payment_confirmation(payment))
  end

  private

  def payment_confirmation(payment)
    time = Time.now + 3600
    "Thanks for your order of £#{payment} on #{time.strftime("%d/%m/%y")}:"\
    "Your order is scheduled to arrive at #{time.strftime("%H:%M")}."
  end
end
