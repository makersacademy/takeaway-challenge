require 'twilio-ruby'

class SendSMS
  TWILIO_PHONE_NUMBER = "+441727260173"
  # include twilio-ruby

  def time
    time = Time.new + 3600
    time.strftime("%k:%M")
  end

  def send_message
    account_sid = 'ACc7885d0faf6d2ee23b548a6a0d68225f'
    auth_token = '15c53f5e9cd5be5319c3b6079470c32c'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    @time = time

    from = TWILIO_PHONE_NUMBER
    to = '+447598190395' # Your mobile phone number
    body = "Thanks! Your order was placed and will be delivered before #{@time}"

    client.api.account.messages.create(
    from: from,
    to: to,
    body: body
    )
  end

end
