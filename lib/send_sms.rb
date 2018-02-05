require 'twilio-ruby'
require 'bundler'
Bundler.require()

class Message
  def send_sms
    account_sid = 'ACa832762f45c4408857332cd25274312e'
    auth_token = '8b1a4c70686bc96f0e70f944b586385c'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      :from => '+441412804093',
      :to => '447756780794',
      :body => 'Tomorrow\'s forecast in Financial District, San Francisco is Clear.')
  end
end
