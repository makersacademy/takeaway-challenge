require 'twilio-ruby'

account_sid = 'AC951287f568042dd4044cb537518e933f'
auth_token = '77c56c7ffa6273bc8134dc63bac06505'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441163263128' # Your Twilio number
to = '+447713836331' # Your mobile phone number

client.messages.create(
    from: from,
    to: to,
    body: "Thank you for placing your order! It will arrive at #{Time.now + 1*60*60}"
)   