require "twilio-ruby"

class Message
  attr_reader :takeaway_number, :client

  def initialize(twilio_client = Twilio::REST::Client, auth_token = ENV["TWILIO_AUTH_TOKEN"],
                 account_sid = ENV["TWILIO_ACCOUNT_SID"], phone = ENV["TAKEAWAY_NUMBER"])
    @takeaway_number = phone
    @client = twilio_client.new(account_sid, auth_token)
  end

  def send(message_body, phone_number = ENV["PHONE_NUMBER"])
    @client.messages.create(
      body: message_body,
      from: @takeaway_number,
      to: phone_number,
    )
  end
end
