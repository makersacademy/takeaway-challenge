require 'twilio-ruby'

class Text

  ACCOUNT_SID = ENV["TWILIOACCOUNTSID"].freeze
  AUTH_TOKEN = ENV["TWILIOAUTHTOKEN"].freeze
  PHONE_NUMBER_FROM = ENV["PHONE_NUMBER_FROM"].freeze
  PHONE_NUMBER_TO = ENV["PHONE_NUMBER_TO"].freeze
  DEFAULT_TWILIO_CLIENT = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN.freeze

  def initialize(twilio_client = DEFAULT_TWILIO_CLIENT)
    @twilio_client = twilio_client
  end

  def send_message
    @twilio_client.messages.create(
      body: "Thanks for your order. It will be with you in roughly an hour",
      to: PHONE_NUMBER_TO,
      from: PHONE_NUMBER_FROM)
  end

end
