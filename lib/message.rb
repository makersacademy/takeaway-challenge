require 'twilio-ruby'
require_relative 'order'

class Message

  def send(order)

   account_sid = "ACc467d770a1b2d9ad0b2fa42e19c82f9d"
   auth_token = "54523e74ae1139717228011e6e8c6b30"

   @client = Twilio::REST::Client.new account_sid, auth_token

   @message = @client.messages.create(
   to: "+447854868412",
   from: "+441233801047",
   body: "Your order is on its way: #{order}"
   )

  end

end