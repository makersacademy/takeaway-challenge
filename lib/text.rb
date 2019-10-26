require 'twilio-ruby'
require 'dotenv'
Dotenv.load("twilio.env")

class Text

  def confirmation
    account_sid = ENV['TWILIO_ACC_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_NUM']
    to = ENV['MOBILE_NUM']

    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create(
      from: from,
      to: to,
      body: notice)
  end

  private

  def notice
    "Your order has been placed and is expected to arrive before #{delivery_time}"
  end

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end
end
