require("bundler") 
Bundler.require()
require 'twilio-ruby'

module Text
  def send_text(total)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH"] 


      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
          body: "Hey, your grub will be with you in an hour! The cost is #{total}",
          to: ENV["PHONE_NUMBER"], 
          from: "+447897014306")  

      puts message.sid
    end
end