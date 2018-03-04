require 'rubygems'
require 'twilio-ruby'
require 'envyable'
Envyable.load('config/env.yml')

require 'rubygems'
require 'twilio-ruby'

account_sid = ENV["TWILLIO_ACCOUNT_SID"]
auth_token = ENV["TWILLIO_AUTH_TOKEN"]

client = Twilio::REST::Client.new account_sid, auth_token

from = '+447533016863' # Your Twilio number
to = '+447399330105' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
