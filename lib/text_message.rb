require 'twilio-ruby'


class TextMessage

def send_confirmation(confirm)

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']


@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: ENV['TWILIO_NUM'],
  to: ENV['MY_NUM'],
  body: confirm
)

end
end
