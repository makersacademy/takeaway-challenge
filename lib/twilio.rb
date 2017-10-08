require 'twilio-ruby'
class Text
  def send_text(message)
    account_sid = "ACf1090abe282db7bbe645870d3b9ae23f" # Your Account SID from www.twilio.com/console
    auth_token = "f5b1cffa4808785e57d39cbbb630a611" # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: message,
        to: "+447810878636", # Replace with your phone number
        from: "++441158244614") # Replace with your Twilio number

    puts message.sid
  end
end
