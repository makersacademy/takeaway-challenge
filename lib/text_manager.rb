
require 'twilio-ruby'
class Text_manager

attr_reader :client

  def delivery_time
    delivery_time = Time.now + 60*60
    delivery_time.strftime("%H:%M")
  end

  def send_text
    account_sid = "ACf838cb00183cf50566b089194efcda50"
    auth_token = "0bc1811945932750f0aa26d99296a0f8"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: "+447956155766",
        from: "+447480537287")
    puts message.sid
  end
end
