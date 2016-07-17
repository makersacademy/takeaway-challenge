require 'twilio-ruby'

# To find these visit https://www.twilio.com/user/account
account_sid = "AC276309d1decc64ab1c661277bc41770f"
auth_token = "7ef700ed280f03e5c673a569fc377fd2"

@client = Twilio::REST::Client.new account_sid, auth_token

@message = @client.messages.create(
  to: "+13216851234",
  from: "+11212856445",
  body: "Hello!"
)
