require 'rubygems'
require 'twilio-ruby'

account_sid = 'ACa12d226ed28efe2f7d4fd199ac242abb'
auth_token = 'd0751fad28cac67c7231ffe72d06afb1'
@client = Twilio::REST::Client.new account_sid, auth_token

from = "+441344231766" # Your Twilio number

friends = {"+447482639626" => "Laurent"}
friends.each do |key, value|
  @client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Thank you #{value}! Your order was placed and will be delivered within the next 45 minutes. Your awsome food delivery company"
  )
  puts "Sent message to #{value}"
end
