require 'twilio-ruby'

class Message
  def self.send
    account_sid = "AC99b4df60cb51920721179c3f11a8d557"
    auth_token = "49eb9fc8ff48aa8beff975fcca165f23"

    time = Time.now
    delivery_time = (time + 3600).strftime("%R")

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: "+447983237885",
        from: "+447492888689")

    message.sid
  end
end
