require "twilio-ruby"

class Phone
  def send_text
    account_sid = "AC0c433944cbed788826573b3f2679ea2e"
    auth_token = "f6b2b0bcfddbc631aa3de7f35b763b9c"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      body: "Thankyou! Your order was placed and will be delivered before 19:45",
      to: "+447922027441",
      from: "+441242650204")
  end
end
