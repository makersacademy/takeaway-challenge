require 'rubygems'
require 'twilio-ruby'

class Text

def send_SMS(phone_number)
account_sid = 'AC69064164571cfd340c23429315dab09d'
auth_token = 'ea1d61a5bad892e013f212a72b6af4df'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+441303720111',
  :to => phone_number,
  :body => "Thank you! Your order was placed and will be delivered before #{Time.now + (60*60)}",
})

end
end
