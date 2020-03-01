require 'twilio-ruby'
require 'dotenv'
Dotenv.load('./.twilio_properties')

module Text

  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']
  @from = ENV["TWILIO_FROM_NUMBER"]
  @to = ENV["TWILIO_TO_NUMBER"]

  def self.twilio_client
    Twilio::REST::Client.new @account_sid, @auth_token
  end
   
  def self.initialize_msg(msg) 
    if msg.nil?  
      delivery_time = (Time.now + (60 * 60)).strftime("%k:%M")
      msg = "Thank you! Your order will be delivered by #{delivery_time}"
    end  
    msg
  end
  
  def self.send_confirmation_text(message = nil)
    message = initialize_msg(message)
    client = twilio_client
    client.messages.create(
        from: @from,
        to: @to,
        body: message
      )
  end
end
