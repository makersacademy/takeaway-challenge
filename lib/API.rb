require 'twilio-ruby'

class API

account_sid = AC0a9b562a6a70854f67caf63498ae2ade
auth_token = 5439683675356007569c198160972443


@client = Twilio::REST::Client.new account_sid, auth_token
r = @client.messages.create({
  :from => '+441572XXXXX',
  :to => '+44751XXXXX',
  :body => 'Tomorrow

end 
