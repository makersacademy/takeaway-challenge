require 'rubygems' 
require 'twilio-ruby'

class TextSender

  def initialize(recipient, message)
    @recipient = recipient
    @message = message
    send_text
  end

  def send_text
    account_sid = ENV["TWILIO_ACCOUNT_SID"] 
    auth_token = ENV["TWILIO_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.api.account.messages.create({
      :from => ENV["TWILIO_FROM"],
      :to => @recipient, 
      :body => @message 
    })
  end
end
