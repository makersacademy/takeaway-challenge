require "twilio-ruby"
require "./lib/message"

class TextClient

  attr_reader :message_formatter

  def initialize(message_formatter = Message.new)
    @message_formatter = message_formatter
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"] 
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end
  
  def send_text
    message = @client.messages.create(
      body: @message_formatter.format_message,
      to: ENV["TWILIO_TO_NUMBER"],
      from: ENV["TWILIO_FROM_NUMBER"])
  end
end
