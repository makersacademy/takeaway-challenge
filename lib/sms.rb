# require 'dotenv'
# Dotenv.load
require 'twilio-ruby'
require "order.rb"

class SMS

  def send_sms(message)

    (account_sid = ENV['TWILIO_ACCOUNT_SID'])#"AC92c547e5a83b07fb5a8e6966f32c40dd")
    (auth_token = ENV['TWILIO_AUTH_TOKEN'])#"54bb8193dd3170aeeeb636488f9dc4b6")

    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    message = @client.account.messages.create(
    body: message,
    to: "+447896215629",#ENV['TWILIO_NUM'],
    from: "+441685732124"#ENV['MY_NUM']
    )

    # puts message.sid
  end
end
#
# sms = SMS.new
# sms.send_sms
