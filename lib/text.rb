require 'twilio-ruby'
require 'time'

module Text

  def send(text)
    account_sid = "ACef3b265110ac900dc6e3404f0a63351a"
    auth_token = "12c9b3d0695627aa436f8f594d8c4bc9"

    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
        to: ["+447802584879"],
        from: ["+441992351213"],
        body: text)
  end
end
