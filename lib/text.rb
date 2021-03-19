require 'rubygems'
require 'twilio-ruby'

class Text
  
  def initialize 
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end 

  def send_sms(total, number)
    @client.messages.create(3
      from: ENV["MY_TWILIO_NUMBER"],
      to: "#{number}",
      body: "Thank you! Your order of £#{total} was placed and will
      be delivered #{Time.now + 60 * 60}.")
  end 

end 
