require 'twilio-ruby'

class Message
  account_sid = ""
  auth_token = ""

  @client = Twilio::REST::Client.new account_sid, auth_token
  @time = (Time.now + (60*60)).strftime("%H:%M")

  def send_message
    @client.account.messages.create(
        to: "",
      from: "",
      body: "Thanks! Your order has been placed and will be with you before #{@time}.")
  end
end
