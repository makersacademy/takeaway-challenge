require 'twilio-ruby'
class NotifyUser
  ACCOUNT_SID = ENV['AC_SID']
  AUTH_TOKEN = ENV['TWIL_TOKEN']

  def self.send_notification
     create_client
     send_message 
  end 
  
  private 
  def self.create_client
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def self.send_message
    @client.messages.create(
      body: "Hello Hungry Person",
      to: "+number_here",
      from: "+number_here") 
  end 
end 

