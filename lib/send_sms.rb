require 'twilio-ruby'

class TextMessager

  def initialize(twilio = Twilio::REST::Client)
    @twilio = twilio
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = twilio.new(account_sid, auth_token)
    @from = ENV["TWILIO_PHONE_NUMBER"]
    @to = ENV["MY_PHONE_NUMBER"]
  end

  def send
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed successfully and will be delivered within 1 hour!")
    true
  end
end
