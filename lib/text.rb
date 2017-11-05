require 'twilio-ruby'
class Text
  def send_text
    account_sid = "" # Your Account SID from www.twilio.com/console
    auth_token = ""   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
        body: "",
        to: "",    # Replace with your phone number
        from: "")  # Replace with your Twilio number

    puts @message.sid
  end
end
