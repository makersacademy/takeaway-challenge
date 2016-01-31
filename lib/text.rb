require 'rubygems'
require_relative 'time'

module Text

  
  def send_text
 
    account_sid = "ACa3ee1dcb650351d40912dde19f344492"
    auth_token = "9894f02d325bb07d11497d8b00132dc7"
    client = Twilio::REST::Client.new account_sid, auth_token
 
    from = "+441465915017" # Your Twilio number
 
    friends = {
    "+447710462854" => "Me"
    }
    
    friends.each do |key, value|
    client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Your payment has been confirmed and your order will be with you by #{Time.now + (60 * 60)}"
    )
  
    puts "Sent message to #{value}"
    end
  end

end