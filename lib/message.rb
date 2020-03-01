require "twilio-ruby"
require_relative "../data/sensitive_data.rb"

class Message
  def sending
    account_sid = ACCOUNT_SID
    auth_token = AUTH_TOKEN

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      to: PHONE_NUMBER,
      from: TWIL_NUMBER,
      body: "your order will be with you in an hour"
    )
  end
end