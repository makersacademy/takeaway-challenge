require 'twilio-ruby'

class SendSMS

  def send(phone_number, total)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['auth_token']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+441543624384' # Your Twilio number
    to = "+#{phone_number}" # Your mobile phone number
    message = "Hey dude - your order is on its way - It'll be £#{total} and it should arrive at #{DeliveryTime.new.time_of_order}!"
    client.messages.create(
    from: from,
    to: to,
    body: message
    )

  end
end
