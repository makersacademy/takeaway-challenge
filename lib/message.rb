require 'twilio-ruby'
require_relative './env.rb'
class Message
  include Env

  def confirmation
    account_sid = Env::TWILIO_ACCOUNT_SID
    auth_token = Env::TWILIO_AUTH_TOKEN
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = Env::TWILIO_FROM
    to = Env::TWILIO_TO

    client.messages.create(
    from: from,
    to: to,
    body: "Nice, we'll be with you before #{(Time.now + 1800).strftime('%I:%M %p')}"
    )
  end
end
