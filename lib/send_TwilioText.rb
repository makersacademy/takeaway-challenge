require 'twilio-ruby'
require 'dotenv/load' #gem dotenv 

class TwilioText
  def send_text
    twilio_account_sid = ENV['TWILIO_ACCOUNT_SID']
    twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_NUM']
    to = ENV['PHONE_NUM']
    client = Twilio::REST::Client.new(twilio_account_sid, twilio_auth_token)
  
    time = Time.now
    arrival = time.hour + 1
  
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{arrival}:#{time.min}"
    )
  end
end