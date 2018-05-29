class Text do


  def send_text
    time = Time.now + 3600.strftime("%H:%M")
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you for your order. Your food will be delibered by #{time}",
        to: "+#{number}",
        from: "+441304410190")
  end
end
