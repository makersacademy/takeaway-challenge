require 'twilio-ruby'

class Messenger
  account_sid = "PN2ba53d6e4525039c3c3c17ebb2bc2a15"
  auth_token = "d8bfb8790ec316cd64d6d254a4bcc6c6"

  @client = Twilio::REST::Client.new account_sid, auth_token
  @time = (Time.now + (60*60)).strftime("%H:%M")

  def send_text
    @client.account.messages.create(
        to: "+375293069300",
      from: "+43676800505017",
      body: "Thank you! Your order was placed and will be delivered before #{@time}.")
  end
end