require 'rubygems'
require 'twilio-ruby'

account_sid = "AC0b5e68dd8ffad76c7ca97787af3b4eca"
auth_token = "3837b88724c6df09e1dafba69b36266a"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+447482042351"

friends = {
"+447482042351" => "Myself",
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Thank you! Your order was placed and will be delivered before 18:52"
  )
  puts "Sent message to #{value}"
end
