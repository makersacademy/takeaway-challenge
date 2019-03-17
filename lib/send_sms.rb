require 'twilio-ruby'

account_sid = 'AC7870dfcc2baf11c988ecbaede2774bff'
auth_token = '161f609fbf99aa9c07a86abd937e110b'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447446151836' # Your Twilio number
to = '+447851945027' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before 18:52"
)
