require 'twilio-ruby'
require_relative 'order'
require 'dotenv'
# Dotenv.load

class Message

  def initialize
    @codes = Dotenv.load
  end

  def send(order)

   account_sid = @codes["ACCOUNT_SID"]
   auth_token = @codes["AUTH_TOKEN"]

   @client = Twilio::REST::Client.new account_sid, auth_token

   @message = @client.messages.create(
   to: @codes["MY_NUMBER"],
   from: "+441233801047",
   body: "Your order is on its way: #{order}"
   )

  end

end