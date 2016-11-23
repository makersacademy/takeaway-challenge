require 'dotenv'
require "twilio-ruby"
require "rubygems"
Dotenv.load

class TwilioAPI

  def send_text( customer_phone_number, message )

    twilio_account_sid = ENV["TWILIO_ACCOUNT_SID"]
    twilio_auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(twilio_account_sid, twilio_auth_token)

    client.account.sms.messages.create(
      :from => ENV["TWILIO_PHONE"],
      :to => customer_phone_number,
      :body => message
    )

  end

end
