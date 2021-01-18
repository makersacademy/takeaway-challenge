require 'twilio-ruby'

class Messenger

  @account_sid = "X"
  @auth_token = "X"

  def confirm
    message = "Thank you! Your order will be delivered by #{(Time.now + 3600).strftime("%H:%M")}."
    send(message)
  end

  def send(message)
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
      body: "#{message}",
      to: "X",
      from: "X")

    puts message.sid
  end

end
