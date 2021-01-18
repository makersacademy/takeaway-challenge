require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Text

  ACCOUNT_SID = ENV["TWILIOACCOUNTSID"].freeze
  AUTH_TOKEN = ENV["TWILIOAUTHTOKEN"].freeze
  PHONE_NUMBER_FROM = ENV["PHONE_NUMBER_FROM"].freeze
  PHONE_NUMBER_TO = ENV["PHONE_NUMBER_TO"].freeze
  DEFAULT_TWILIO_CLIENT = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN.freeze

  private_constant :ACCOUNT_SID, :AUTH_TOKEN, :PHONE_NUMBER_FROM, :PHONE_NUMBER_TO, :DEFAULT_TWILIO_CLIENT

  def initialize(twilio_client = DEFAULT_TWILIO_CLIENT)
    @twilio_client = twilio_client
  end

  def send_message
    @twilio_client.messages.create(
      body: "Thanks for your order from Tasty Tuck. It will be with you in roughly an hour.",
      to: PHONE_NUMBER_TO,
      from: PHONE_NUMBER_FROM)
    return "Message sent."
  end

end
