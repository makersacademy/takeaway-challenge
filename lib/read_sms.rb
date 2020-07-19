require 'twilio-ruby'
require_relative './send_sms'

class OrderRead
  attr_reader :message_list

  def initialize
    @message_list = []
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @messages = @client.messages.list(
      from: ENV["DMOB"],
      limit: 20)
    read(@messages)
  end

  def read(messages = @messages)
    messages.each do |record|
      #puts record.body
      @message_list << record.body
    end
    send_text(@message_list)
  end

  def send_text(message_list)
    message_list.include?("order") ? TwilioClass.new.send : "No order to send"
  end

end