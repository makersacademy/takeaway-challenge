require 'rubygems'
require 'twilio-ruby'

class SMS

  def send_sms(message)
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token

        @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: ENV['PHONE_NUMBER'],
      body: message
    )
  end

end