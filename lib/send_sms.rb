require 'twilio-ruby'
require 'dotenv/load'

class SendSMS
  
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
      
    @from = ENV['TWILIO_TRIAL_NUMBER'] # Your Twilio number
    @to = ENV['TWILIO_VERIFIED_NUMBER'] # Your mobile phone number
  end
  
  def send
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Twilio test!"
      )
  end
end
