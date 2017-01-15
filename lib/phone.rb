require 'dotenv'
require 'twilio-ruby'
module Phone
  Dotenv.load
  ACCOUNT_SID   = ENV['ACCOUNT_SID']
  AUTH_TOKEN    = ENV['AUTH_TOKEN']
  PHONE_NUMBER  = ENV['PHONE_NUMBER']
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  def self.send_confirmation_text (phone_number)
    text = "cheers! your food will be with you in t+1hour"
    message_hash = {body: text,to: PHONE_NUMBER,from: TWILIO_NUMBER}
    message = @client.account.messages.create(message_hash)
    #puts message.sid
  end
end
