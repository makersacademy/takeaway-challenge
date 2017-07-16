class Message
  def send_message(order)
    require 'twilio-ruby'
    @account_sid = "ACa37fb9dee53bb1f468ecddfcdd0556ac"
    @auth_token = "5a9ab3d2e1d7983e2b673a2d4bec04a6"
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
        body: "Thank you! Your #{order} was placed and will be delivered before #{scheduled_time}",
        to: "+33638445671",
        from: "+441322250706")
    puts message.sid
  end

  def scheduled_time
    t = Time.now
    hour = t.strftime('%H').to_i+1
    hour = 00 if hour >= 23
    hour.to_s + ':' + t.strftime('%M')
  end
end
