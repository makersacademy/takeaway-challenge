# Download the helper library from https://www.twilio.com/docs/ruby/install
require "rubygems"
require "twilio-ruby"

class Sms_notifier
  def send_message(message)
    # Find your Account SID and Auth Token at twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    phone1 = ENV["PHONE_TWILIO"]
    phone2 = ENV["PHONE_CUSTOMER"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    messagex = @client.messages
      .create(
        body: message,
        from: phone1,
        to: phone2,
      )

    puts messagex.sid
  end
end
