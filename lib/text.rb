require 'twilio-ruby'

class Text

  def confirmation

    account_sid = 'ACd7bd438097782e4c79a158fb3500290e'
    auth_token = 'ed0c45f4d04589b5cf5f1f488beeeb08'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447533011143'
    to = '+447746406608'

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you, your order has been placed and wil arrive before 15:30!"
    )

  end
end
