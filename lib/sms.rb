require 'twilio-ruby'

# My account codes
account_sid = ACe16a4eddf4b5e19a3331831d7df88b9b
auth_token = f6964d00315fe133190e213d9cc775f1

@client = Twilio::REST::Client.new(account_sid, auth_token)


client.messages.create(
  from: +447480537261
  to: +7968841830
  body: "Thank you! Your order was placed and will be delivered before 18:52"
)
