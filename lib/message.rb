
require "twilio-ruby"
accountSid = "ACdc9c508fe1a9c98e33c29ff46580ba1c"
authToken = "e3ed6469f0157c93cde70b52f8a96f4"
client = Twilio::REST::Client.new(accountSid,authToken)


client.messages.create(
from:ENV['44238002138'],
to:ENV['07515137550'],
body: "Hi your fodd will be delivered before 6:52pm"
)
