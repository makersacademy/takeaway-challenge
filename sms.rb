require 'twilio-ruby'


accountSID = "ACb339810ad9c924f6b97e2ea82cb2a92a"
auth_token = "2f448d6981fe0174bb65d7c2d4d98780"

@client = Twilio::REST::Client.new accountSID, auth_token

from = '+441363688018'
to  = '+447771876666'

message = @client.account.messages.create(
  {
    :from => from,
    :to => to,
    :body => "Hello"

  }


)
