require 'twilio-ruby'

class TextConfirmation
  def send_message(total)
    account_sid = 'AC2e0fef6e6df884dc1b44d133174d6b80'
    auth_token = '6f98c85d4b22c9b99304aaa16978c5eb'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+447733088462'
    to = '+447935294331'
    time = Time.new
    client.messages.create(from: from, to: to,
      body: "Thank you for your order.
Total order price: £#{total}.
Expected delivery time: #{time.hour + 1}:#{time.min}.")
  end
end