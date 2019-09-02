
require 'twilio-ruby'

class SMS

  account_sid = 'ACc7956f146633602efdef0a3a9356623a'
  auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = 'ENV["MY_MOB"]' # Your Twilio number
  to = '+15555555555' # Your mobile phone number

  client.account.messages.create(
  from: from,
  to: to,
  body: "Hey friend!"
  )

end
