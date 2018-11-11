require 'twilio-ruby'

account_sid = 'AC04bc3c411d276059731f2bb3cb259375'
auth_token = 'a113ded30d75e81269b8cd4a41e12096'

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
    from: "+12282313459",
    to: "",
    body: "Helle meow")