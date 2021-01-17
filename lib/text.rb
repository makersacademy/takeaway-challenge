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
    delivery_time = order_time + 3600 - order_time.sec
    @twilio_client.messages.create(
        body: "sdsd " + delivery_time.strftime("%k:%M") + "sdsdsdsd",
        to: PHONE_NUMBER_TO,
        from: PHONE_NUMBER_FROM)
  end

end

# @client =
# message = @client.messages.create(
#     body: "Love you Emily",
#     to: phone_number_to,    # Replace with your phone number
#     from: phone_number_from)  # Use this Magic Number for creating SMS
#
# message_sid =  message.sid
#
# made_message =  @client.api.messages(message_sid).fetch
#
# p made_message
