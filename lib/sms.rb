require "twilio-ruby"

module Sms

  def time
    plus_one_hour = Time.now + 60 * 60
    plus_one_hour_formatted = now.strftime('%H:%M')
  end

  def send
    account_sid = ENV["TWILIO_ACCOUNT_ID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: +441382250586,
      body: "Your order will be with you by #{time}"
    )
  end
end
