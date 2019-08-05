# require 'twilio-ruby'
require 'time'
require("bundler")
Bundler.require()

class SendSms

  def send_message

    account_sid = TWILIO_ACCOUNT_SID
    auth_token = "7a236fd0c60a0c061b76656866cf52be"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before
      #{(Time.now + 3600).strftime('%H:%M')}",
      to: "+447453274742",    # Replace with your phone number
      from: "+441133207987")  # Replace with your Twilio number
    puts message.sid
  end
end
