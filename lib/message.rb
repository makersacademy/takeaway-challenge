require 'dotenv'
Dotenv.load

class Message

  def initialize
    account_sid = "AC9e08cf89a069abf78ee15d77cd7a1363"
    # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "84f4c2388aca22d5b248fdfe1c396c6e"
    # Your Test Auth Token from www.twilio.com/console/settings

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).strftime("%H:%M")}.",
      to: ENV["MY_NUMBER"],
      from: ENV["SEND_NUMBER"])
      # Use this Magic Number for creating SMS
  end

end
