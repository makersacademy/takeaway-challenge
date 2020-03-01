require 'twilio-ruby'

account_sid = ENV["ACC_SID"]
auth_token = ENV["AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.api.account.messages.create(
    to: ENV["MY_NUMBER"],
    from: ENV["TWILIO_NUMBER"],
    body: "You are so beautiful. Waiting for holy paws. Booooop"
)
