# require "twilio-ruby"

class Msg

  def text
    account_sid = "ACadb6b2c8e871cbcc1ba56231fd4016f2"
    auth_token = "17b277cb1fdbed059f5998670f4fefce"
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before 18:52",
        to: "+447989796257",
        from: "+441158241510")

  end

end
