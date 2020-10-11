require 'twilio-ruby'
# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
module Send_SMS

  def self.send(time)

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_TRIAL_NUM"] # Your Twilio number
    to = ENV["MY_MOBILE"] # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{time}!"
    )

  end

end

Send_SMS.send(Time.now)
