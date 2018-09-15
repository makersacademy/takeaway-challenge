require 'twilio-ruby'
require 'dotenv/load'

class Message 
  SID = ENV['TWILIO_ACCOUNT_SID']

  def send_text
  end

end
 
p ENV['TWILIO_ACCOUNT_SID']