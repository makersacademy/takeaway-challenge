require 'twilio-ruby'

class Messenger

  def send_message
    time = Time.now + 60 * 60
    time_format = time.strftime("%R")

    account_sid = "AC730ed77239e3b9afa37e95cbe2e1e9da" # Your Account SID from www.twilio.com/console
    auth_token = "bf83be41cf3dabf26b90742ca2e44b94"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thanks for your order, it will arrive at #{time_format}.",
      to: "+44 ",    # Replace with your phone number
      from: "+441488760047")  # Replace with your Twilio number
      puts message.sid
  end
end
