require 'twilio-ruby'
require 'fake_sms'

module Send_SMS

  def self.send(time)

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_TRIAL_NUM"]
    to = ENV["MY_MOBILE"]

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{time}!"
    )

  end
end
