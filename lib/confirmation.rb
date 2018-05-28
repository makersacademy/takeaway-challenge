require 'twilio-ruby'

require 'csv'

class Confirmation

  def send
    data = CSV.read('./lib/data.csv')
    account_sid = data[0][1] # Your Account SID from www.twilio.com/console
    auth_token = data[2][1]   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before 18:52",
        to: data[4][1],    # Replace with your phone number
        from: data[5][1])  # Replace with your Twilio number

    puts message.sid
  end
end
