# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'



class Delivery


  def send_message
    account_sid = 'AC45781440221ef5d63d523515fb0801e6'
    auth_token = '0667ea6f68363860fcded9b1f886743e'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441440966037' # Your Twilio number
    to = '+447825610076' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed at #{Time.now.strftime('%X')} and will be delivered in the next 60 minutes "
    )
  end
end
