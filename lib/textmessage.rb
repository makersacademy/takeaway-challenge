require 'twilio-ruby'
class TextMessage
  def send_text
    account_sid = 'AC8aca30ad2da7fa3c02de9c4171d6225d'
    auth_token = '660bc95d812c952191eb8473e6374ba0'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441303720105' # Your Twilio number
    to = '+447939945009' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Your food is on the way!"
    )
  end
end
