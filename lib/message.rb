class Message
  
  require 'rubygems'
  require 'twilio-ruby'
  require 'dotenv'


  def send_text(message)
    twilio_account_sid = ENV['ACCOUNT_SID']
    twilio_auth_token = ENV['AUTH_TOKEN']
    twilio_phone = ENV['TWILIO_PHONE']
    twilio_destination_phone = ENV['TWILIO_DESTINATION_PHONE']

    Twilio::REST::Client.new(twilio_account_sid, twilio_auth_token)
    .messages.create(
    from: twilio_phone,
    to: twilio_destination_phone,
    body: message
    )
   end
end
