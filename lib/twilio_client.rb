require 'twilio-ruby'
require 'dotenv/load'

class TwilioClient
  attr_reader :client
  def initialize
    @client = Twilio::REST::Client.new(
      account_sid = ENV["TWILIO_ACCOUNT_SID"],
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
    )
  end
end
