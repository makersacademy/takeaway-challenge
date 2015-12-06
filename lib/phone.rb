require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Phone
  SMS = "Thank you! Your order was placed and will be delivered before "

  def initialize
    @account_sid = ENV['ACCOUNTSID']
    @auth_token = ENV['AUTHTOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def complete_order
    send_text(SMS + (Time.now + 3600).strftime("%H:%M") + '.') 
  end

  private
  attr_reader :account_sid, :auth_token
  
  def send_text message
    @client.messages.create(
      from: '+441173251426',
      to: ENV['PHONE'],
      body: message
    )
  end
end
