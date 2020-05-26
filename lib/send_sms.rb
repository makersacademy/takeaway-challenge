require_relative 'order'
require 'twilio-ruby'

class Message

  def confirmation_text

    account_sid = 'AC434407bd7130d35abe9799d542f94116'
    auth_token = '39dcc537dfba28ab748c319248d4dad9'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12513579138' # Your Twilio number
    to = '+447912212181' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thanks for your order from Costa Del Oval. You're delicious food will arrive in #{1 + 1}!"
    )

  end
end

