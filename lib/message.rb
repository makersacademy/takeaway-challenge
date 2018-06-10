require 'csv'
require 'twilio-ruby'

class Message
  def send
    auth = CSV.read('./lib/auth.csv')
    account_sid = auth[0][0]
    auth_token = auth[1][0]

    # Initialize Twilio Client
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    time = Time.now + 3600

    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}",
        to: auth[2][0],
        from: auth[3][0])

    puts message.sid

  end
end
