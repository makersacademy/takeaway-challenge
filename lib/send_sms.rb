require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC3a0312ce7c94c7e0923f9a9b43a29226'
auth_token = '
99ada26d753e673df7fd4fb602c4e54f
'
client = Twilio::REST::Client.new account_sid, auth_token

from = '+441915804446' # Your Twilio number
to = '+447921502765' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
