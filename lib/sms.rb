require 'rubygems'
require 'twilio-ruby'

class Sms

  def send
    account_sid = "AC7cfab60713e8f882d9f61474a66fa5b5"
    auth_token = "dd2d1701caf740397cc908d6917a2f2a"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441158243897" # Your Twilio number
    to = "+447545968261"

    delivery_time = (Time.now + 3600).strftime('%H:%M')

    client.account.messages.create(
      :from => from,
      :to => to,
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
    puts "SMS successfully sent"
  end

end
