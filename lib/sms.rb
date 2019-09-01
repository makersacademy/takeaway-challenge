# require 'bundler'
# Bundler.require()
require 'twilio-ruby'

class SMS
  def send_sms(mobile = ENV["MY_NUMBER"], text = "test")
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_PHONE_NUMBER"]

    @client.messages.create(
      to: mobile,
      from: from,
      body: text
    )
  end
end
