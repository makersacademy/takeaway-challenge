require 'twilio-ruby'

class SMS

  def send_sms(message)
    account_sid = "ACe4e7f5d6667945e5486bd07a9be8168e" # Your Account SID from www.twilio.com/console
    auth_token = "f3b554ecf44c9d3b2d56c282a570b97c"   # Your Auth Token from www.twilio.com/console

    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
        to: ["+447933724561"],    # Replace with your phone number
        from: ["+441618507364"],
        body: message)  # Replace with your Twilio number
  end
end
