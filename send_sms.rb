require 'bundler'
Bundler.require()

account_sid = 'ACe2881c82b9bda1b165115afe7eb8dacf'
auth_token = '3f0be3da095b628f81bf184acaf4f982'
@client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441423740374' # Your Twilio number
to = '' # Your mobile phone number

@client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)


# +441423740374
