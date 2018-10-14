require 'twilio-ruby'
# require 'order'

module SendSMS
  TWILIO_PHONE_NUMBER = "+441727260173"
  ACCOUNT_SID = 'ACc7885d0faf6d2ee23b548a6a0d68225f'
  AUTH_TOKEN = '15c53f5e9cd5be5319c3b6079470c32c'

  def initialize
    @time = time
  end

  def time
    time = Time.new + 3600
    time.strftime("%k:%M")
  end

  def send_message
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

    from = TWILIO_PHONE_NUMBER
    to = '+447598190395'
    body = "Thanks! Your order was placed and will be delivered before #{@time}"

    client.api.account.messages.create(
    from: from,
    to: to,
    body: body
    )
  end
end
