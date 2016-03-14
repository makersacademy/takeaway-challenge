require 'sinatra'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class DeliveryMessage

  def send_message

  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV["AUTH_TOKEN"]
  client = Twilio::REST::Client.new account_sid, auth_token



    client.account.messages.create(
      :from => '+441595922048',
      :to => "07545969025",
      :body => "Hey , delivery will arrive. Thanks!"
    )
    puts "Sent message yo"

   end

end
