require 'rubygems'
require 'twilio-ruby'

# uses the Twilio API to send confirmation text
class Sms

  def send(amount)
    account_sid = "AC7cfab60713e8f882d9f61474a66fa5b5"
    auth_token = "dd2d1701caf740397cc908d6917a2f2a"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441158243897" # Your Twilio number
    to = "+447545968261"

    time = delivery_time
    amount = amount

    client.account.messages.create(
      :from => from,
      :to => to,
      :body => "Thank you! Your order for £#{amount} was placed and will be delivered before #{delivery_time}"
    )
    puts "SMS successfully sent"
  end

  def delivery_time
    (Time.now + 3600).strftime('%H:%M')
  end
end
