require 'twilio-ruby'

class Text

  def send
    account_sid = "AC66383f8637b98199adab167d20c3e9d6" # Your Account SID from www.twilio.com/console
    auth_token = "15f254f8e0e2df38f7ec00e759eb63f3"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before 18:52",
        to: "+447732911013",    # Replace with your phone number
        from: "+441598272011")  # Replace with your Twilio number

    puts message.sid
  end
end
