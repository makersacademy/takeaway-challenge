require 'twilio-ruby'
require 'dotenv'

class Phone
  SMS = "Thank you! Your order was placed and will be delivered before "

  def initialize(account_sid=ENV['ACCOUNTSID'], auth_token=ENV['AUTHTOKEN'])
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def complete_order
    send_text(SMS + time_in_an_hour + '.') 
  end

  private
  
  def send_text message
    @client.messages.create(
      from: '+441173251426',
      to: ENV['MYPHONE'],
      body: message
    )
  end

  def time_in_an_hour
    (Time.now + 3600).strftime("%H:%M") 
  end
end
