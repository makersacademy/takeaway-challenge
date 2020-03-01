require 'twilio-ruby'
require 'dotenv/load'

class OrderConfirmation

  def send_message
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{(Time.now+1*60*60).strftime("%H:%M")}",
        to: ENV["TO"],
        from: ENV["FROM"])

    puts message.sid
  end

end
