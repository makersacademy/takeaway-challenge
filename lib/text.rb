require 'dotenv'
require 'twilio-ruby'

Dotenv.load

class Text

  ACCOUNT_SID = ENV["TWILIOACCOUNTSID"].freeze
  AUTH_TOKEN = ENV["TWILIOAUTHTOKEN"].freeze
  PHONE_NUMBER_FROM = ENV["PHONE_NUMBER_FROM"].freeze
  PHONE_NUMBER_TO = ENV["PHONE_NUMBER_TO"].freeze
  DEFAULT_TWILIO_CLIENT = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN.freeze

  private_constant :ACCOUNT_SID, :AUTH_TOKEN, :PHONE_NUMBER_FROM,
                   :PHONE_NUMBER_TO, :DEFAULT_TWILIO_CLIENT

  def initialize(twilio_client = DEFAULT_TWILIO_CLIENT)
    @twilio_client = twilio_client
  end

  def send_delivery_expected(order_time)
    delivery_time = delivery_time_string_from(order_time)
    create_text(delivery_time)
  end

  private

  def delivery_time_string_from(order_time)
    delivery_time = order_time + 3600 - order_time.sec
    delivery_time.strftime("%k:%M")
  end

  def create_text(delivery_time)
    @twilio_client.messages.create(
        body: "Thanks for your order. It will be with you by #{delivery_time}",
        to: PHONE_NUMBER_TO,
        from: PHONE_NUMBER_FROM)
  end

end
