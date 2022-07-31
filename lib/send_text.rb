require 'twilio-ruby'
require 'dotenv/load'

class SendText
  def go_send
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @time = Time.now + (1 * 60 * 60)

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message
  end

  def message
    from = '+12018842873'
    to = ENV['MY_PHONE']

    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%k:%M")}"
    )
  end
end
