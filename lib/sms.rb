require 'twilio-ruby'

account_sid = ""
auth_token = ""

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "",
    from: "")
