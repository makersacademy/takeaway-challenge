require 'twilio-ruby'

TWILIO = {
  acct_sid: ENV['TWILIO_ACCOUNT_SID'],
  auth_token: ENV['TWILIO_AUTH_TOKEN'],
  from: ENV['TWILIO_FROM_NUMBER'],
  to: ENV['TWILIO_TO_NUMBER']
}.freeze

class Messaging
  def initialize
    @client = Twilio::REST::Client.new(TWILIO[:acct_sid], TWILIO[:auth_token])
    @checkout_confirm = "Thank you! Your order was placed and "\
    "will be delivered before #{delivery_time.strftime('%H:%M')}"
  end

  def delivery_time
    Time.new + 3600
  end

  def send(text = @checkout_confirm, from = TWILIO[:from], to = TWILIO[:to])

    @client.messages.create(
    from: from,
    to: to,
    body: text
  )

  end

# private

  attr_reader :client

end
