require 'twilio-ruby'

class Message
  account_sid = "AC9a55607c3a5ce2fc1e82378235a60071"
  auth_token = "dbc0c66e9e77b62c444e0ff590c6e7cb"

  @client = Twilio::REST::Client.new account_sid, auth_token
  @time = (Time.now + (60*60)).strftime("%H:%M")

  def send_message
    @client.account.messages.create(
        to: "07437583834",
      from: "07437583834",
      body: "Thanks! Your order has been placed and will be with you before #{@time}.")
  end
end
