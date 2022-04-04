require 'twilio-ruby'
require 'money'
require_relative 'credentials' # test file with twilio credentials

PHONE_NUMBER = Credentials::PHONE_NUMBER 

# set up a client to talk to the Twilio REST API

class Messenger

  def initialize
    
    @account_sid = Credentials::ACCOUNT_SID
    @auth_token = Credentials::AUTH_TOKEN
    @messaging_service_sid = Credentials::MESSAGING_SERVICE_SID  
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message
    @client.messages.create(body: text, messaging_service_sid: @messaging_service_sid, 
to: PHONE_NUMBER) 
  end

  private 
  
  def text
    "You order will be here by #{one_hours_time}"
  end

  def one_hours_time
    time = Time.now + 3600
    time.strftime("%H:%M")
  end
end
