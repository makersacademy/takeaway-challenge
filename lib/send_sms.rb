require 'twilio-ruby'

account_sid = 'ACd5a9f1864bca50ee0aca797630101375'
auth_token = '1dc40490bfb8ad122c5dd7a90427780b'

client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441303720101'
to = '+44 7817 933608'

client.api.account.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
