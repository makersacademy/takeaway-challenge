require 'twilio-ruby'
require 'dotenv'

Dotenv.load

#load './env_vars'


class Message

  def initialize
    
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end


# from = '+447723436919' # Your Twilio number
# to = '+447802864295' # Your mobile phone number
  def send_sms
    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM'],
      body: customer_message)
  end
private

  def customer_message
    "Order placed. It will be with you by #{(Time.new + 60*60).strftime("%I:%M %p")}"
  end
end