require 'dotenv'
Dotenv.load

require 'twilio-ruby'

class Confirmation

  def initialize(client = nil)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH']
    @client = client || Twilio::REST::Client.new(account_sid, auth_token)
  end

  def sent_text
    message = @client.messages.create(
      body: "Thank you! The order was placed and will be delivered before #{delivery_time}",
      to: ENV['SEND_TO'],
      from: ENV['FROM'])    
  end

  private
  def delivery_time
    (Time.now + 1800).strftime("%H:%M")
  end

end
