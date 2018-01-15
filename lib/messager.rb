require 'twilio-ruby'
require 'dotenv/load'

class Messager

  def initialize
    @account_sid = ENV["TWILIO_ACC_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
  end

  def confirm_order_by_text(message)
    client = Twilio::REST::Client.new(@account_sid, @auth_token)
    client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
      body: message)
  end

end

# floats
