# require 'rubygems'
# require 'twilio-ruby'

# account_sid = "ACbcc9164f319e3971f2f7a47b625c4bf0"
# auth_token = "59355d0298cd6b3a08322d78328bc4d7"
# @client = Twilio::REST::Client.new account_sid, auth_token

# def send_message
#   message = @client.account.messages.create(
#     body: "Hello, testing",
#     to:  "+447527428379",
#     from: "+441588242013")
#   puts message.sid
# end

# send_message
# from = "+441588242013"
# to = "+447527428379"
# body = "Hello, testing"
# friends = {
# "+14153334444" => "Curious George",
# "+14155557775" => "Boots",
# "+14155551234" => "Virgil"
# }
# friends.each do |key, value|
#   client.account.messages.create(
#     :from => from,
#     :to => key,
#     :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
#   )
#   puts "Sent message to #{value}"
# end