require 'rubygems'
require 'twilio-ruby'

account_sid = 'ACa832762f45c4408857332cd25274312e'
auth_token = '[8b1a4c70686bc96f0e70f944b586385c]'


@client = Twilio::REST::Client.new(account_sid, auth_token)
@client.messages.create(
  :from => '+441412804093',
  :to => '+447756780794',
  :body => 'Thanks, your order has been set and will be delivered in 1 hour from now!'
)
puts @client.http_client.last_response.status_cod
