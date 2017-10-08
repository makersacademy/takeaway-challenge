require 'twilio-ruby'
class Text
  def send_text(message)
    account_sid = "ACf1090abe282db7bbe645870d3b9ae23f"
    auth_token = "f5b1cffa4808785e57d39cbbb630a611" # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
        body: message,
        to: "+447810878636",
        from: "++441158244614")
  end
end
