class Text do

  account_sid = "AC6eed781cf5d61ff547d3b56685fce6b3"
  auth_token = "accdb2114f4e3151da0b86099d818763"

  def send_text
    time = Time.now + 3600.strftime("%H:%M")
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you for your order. Your food will be delibered by #{time}",
        to: "+447711896812",
        from: "+441304410190")
  end
end
