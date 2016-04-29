require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def send
    account_sid = ENV['ACC_SID']
    auth_token = ENV['AUTH']
    from = ENV['TWILIO_NUMBER']
    to = ENV['RECEIVER_NUMBER']
    delivery_time = (Time.now + 3600).strftime("%H:%M")

    body = "Thank you! Your order will be delivered before #{delivery_time}"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => from,
      :to => to,
      :body => body,
    })
  end

end
