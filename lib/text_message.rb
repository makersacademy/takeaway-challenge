require 'twilio-ruby'
require './config/environments/test'

class TextMessage

  def initialize
    account_sid = ENV["TWILIO_ACC_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    message = @client.messages.create(
        body: "Hello there",
        to: ENV["TO_NUMBER"],
        from: ENV["FROM_NUMBER"])
    puts message.sid
  end

end
