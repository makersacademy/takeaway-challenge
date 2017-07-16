# this classes responsibility is to send a text with a string once an order is placed
class MsgSender
=begin
  require 'twilio-ruby'

  account_sid = "ACae4d77700e129e646608cea2e957ce32"
  auth_token = "5fd7cfd5940811b1c6dea7bc36ed42dd"

  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before in 1 hour",
      to: "+420720759109",
      from: "+420720759109")

  puts message.sid
=end
end
