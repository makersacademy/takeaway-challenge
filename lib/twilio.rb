require 'twilio-ruby'

class Message
  attr_reader :from, :to, :body

  def initialize
    account_sid = 'ACacf79708759e4c2197befcf51bdd4657'
    auth_token = '60e538a0f7f1c5eab311448ca180e02a'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    @client.messages.create(
       body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}",
       to: "+447935761438",
       from: "+441323700433"
     )
  end
end
