require 'dotenv'
require 'twilio-ruby'
module Phone
  Dotenv.load
  ACCOUNT_SID   = ENV['ACCOUNT_SID']
  AUTH_TOKEN    = ENV['AUTH_TOKEN']
  PHONE_NUMBER  = ENV['PHONE_NUMBER']
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  def self.send_confirmation_text phone_number = PHONE_NUMBER
    time = (Time.new + (60*60)).strftime("%H:%M")
    text = "cheers! your food will be with you by #{time}"
    message_hash = {body: text,to: phone_number,from: TWILIO_NUMBER}
    message = @client.account.messages.create(message_hash)
    text
  end
end
