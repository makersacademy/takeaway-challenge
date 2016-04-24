require 'rubygems'
require 'twilio-ruby'

account_sid = "AC83610dffc2aba0550cbeb134e7f7b61e"
auth_token = "b9761263fe46a5726a718486ca3a04d1"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+16572206632" # Your Twilio number

friends = {
"+15626317216" => "Nick"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
