require 'twilio-ruby'

class Sms

  def send

    account_sid = 'ACc08ab097e2f139cfb0bceab20eb24b48'
    auth_token = '885e51e20463204e6c4c094e29da5739'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441688212023' # Your Twilio number
    to = '+447809357149' # Your mobile phone number

    client.api.account.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order will be delivered within the hour!"
    )

  end

end
