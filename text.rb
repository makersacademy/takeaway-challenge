require 'rubygems'
require 'twilio-ruby'
 
account_sid = "ACc64b0e6d696ae19134cc684744958973"
auth_token = "169b060db597c36ff8246b320e85bd62"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+441767512024" # Your Twilio number
 
friends = {"+447985177537" => "Curious George"}
time = Time.new
time2 = time + (60*60)
time_format = time2.strftime("%H:%M:%S")
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Thank you! Your order was placed and will be delivered before #{time_format}"
  )
  puts "Sent message to #{value}"
end