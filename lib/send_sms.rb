require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC09c3f33609c1212163f034b3b06d8bab'
auth_token = '{{ 3a16956dbda9c2074cbcba205fc514bb }}'
client = Twilio::REST::Client.new account_sid, auth_token

from = "+441212854805" # Your Twilio number

friends = {
"+4407340207478" => "Me",
"+14155557775" => "Boots",
"+14155551234" => "Virgil"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
