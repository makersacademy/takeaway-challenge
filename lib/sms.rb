require 'dotenv'
Dotenv.load
require 'twilio-ruby'
require "./lib/order.rb"

class SMS

  def send_sms(message)

    (account_sid = ENV['TWILIO_ACCOUNT_SID'])
    (auth_token = ENV['TWILIO_AUTH_TOKEN'])

    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    message = @client.account.messages.create(
    body: message,
    to: ENV['TWILIO_NUM'],
    from: ENV['MY_NUM']
    )

  end
end
