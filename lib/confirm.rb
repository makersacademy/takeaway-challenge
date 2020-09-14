require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load 

class Text
  
  def sms

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      to: ENV['NUMBER'],
      from: '+12059316248',
      body: "Thank you for your order, it should be with you at #{Time.now + 3600}"
    )
  end 
end
