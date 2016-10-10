require_relative 'order'
require 'twilio-ruby'
require 'sinatra'

class Text

def initialize
  account_sid = 'AC6fc2bc71d6e5ad58cf78e86ce1a9937b'
  auth_token = '7c725aaa8ef3e6b2ca9bd8462b95ae7f'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

end

def send
  @client.account.messages.create(
    from: '+441202286058',
    to: '+447854818198',
    body: message
  )

end

def message
time = Time.now + (60*60)
time = "#{time.hour}:#{time.min}"
"Thank you! Your order was placed and will be delivered before #{time}"
end



end
