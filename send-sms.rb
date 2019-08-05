require_relative 'order'
require("bundler")

Bundler.require

account_sid = "AC2e1ac993aca31d47424ddfde7fcf6003"
auth_token = "99b34c4e6c084558d8d4971002ec2415"

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client = client.messages.create(
  to::Env["07484356594"]
  from "+441288255120"
  body "your Order will be delivered at #{}"
)
