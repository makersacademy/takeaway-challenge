require 'dotenv/load'
Dotenv.load('twilio.env')

class Sms
  def send_sms(order, time)
    require 'twilio-ruby'

    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: ENV['to_number'],
      from: ENV['from_number'],
      body: "Thank you! Your order of #{order} will be delivered by #{time.strftime("%H:%M")}. Enjoy!"
    )
  end
end
