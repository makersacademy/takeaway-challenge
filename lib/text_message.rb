require 'twilio-ruby'
require 'website'
 
account_sid = "AC37186c7331d975d1ff1fc577f6ac96d3"
auth_token = "dd13cac0ea5ccd88773bcb3b48bc58c6"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+441652462054"
 
test = {
"+447447001953" => :time
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Thank you! Your order was placed and will be delivered before #{value}!"
  )
  puts "Sent message to customer"
end