require 'rubygems'
require 'twilio-ruby'

class TwilioInterface
  attr_reader :account_sid, :auth_token, :restaurant_phone, :client, :twilio_phone
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_PHONE = ENV['RESTAURANT_PHONE']
  TWILIO_200_RESPONSE = "message_sent".freeze

  def initialize(client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    @twilio_phone = TWILIO_PHONE
    @client = client
  end

  def send_message(body, customer_phone)
    @client.messages.create(
      body: body,
      messaging_service_sid: 'MG0188b82a4c6fa4ff856645c14266b417',
      to: customer_phone
    )
  end
end
