require 'twilio-ruby'

account_sid = "AC0d7cc053a5fdb7fd13c53b327a791c7e" # Your Test Account SID from www.twilio.com/console/settings
auth_token = "521d6e538a3c87f20fd5d8bbc05f02b5"   # Your Test Auth Token from www.twilio.com/console/settings

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447957467743",    # Replace with your phone number
    from: "+18592870594")  # Use this Magic Number for creating SMS

puts message.sid