
class Message
  attr_reader :account_sid, :auth_token
  def initialize
    @account_sid = "ACa37fb9dee53bb1f468ecddfcdd0556ac"
    @auth_token = "5a9ab3d2e1d7983e2b673a2d4bec04a6"
  end

  def send_message(order)
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
        body: "Thank you! Your #{order} was placed and will be delivered before #{scheduled_time}",
        to: "+447586465901",
        from: "+441322250706")
    puts message.sid
  end

  def scheduled_time
    t = Time.new + (60 * 60)
    "#{t.hour}:#{t.min}"
  end
end
#
