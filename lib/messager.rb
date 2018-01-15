require 'twilio-ruby'
require 'dotenv/load'

class Messager

  def initialize(client = Twilio::REST::Client)
    @new_client = client.new(ENV["TWILIO_ACC_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def confirm_order_by_text(message)
    @new_client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
      body: message)
  end

end

# floats
# MENU class
