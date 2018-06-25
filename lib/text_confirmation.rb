require 'twilio-ruby'

class TextConfirmation
  def send_message(amount)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['TWILIO_PHONE_NUMBER']
    to = ENV['MY_PHONE_NUMBER']
    time = Time.new
    client.messages.create(from: from, to: to,
      body: "Thank you for your order.
Total order price: £#{amount}.
Expected delivery time: #{time.hour + 1}:#{time.min}.")
  end
end
