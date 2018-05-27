require 'twilio-ruby'

account_sid = "ACb43015c016af0abbacd874a67206acfb"
auth_token = "ad17d55d34384b150b2df1c46ac38ff0"

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Message from Ruby",
    to: "+447857391643",
    from: "+447480487590")

puts message.sid
