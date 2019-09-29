require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  ACC_SID = ENV["TWILIO_ACC_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]

  def initialize(client = Twilio::REST::Client.new(ACC_SID, AUTH_TOKEN))
    @client = client
  end

end