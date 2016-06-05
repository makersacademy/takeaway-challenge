def send_sms
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC2f4ebb089bdfbfa5136edb094c751f26'
auth_token = '851cc308540c2c915c40c16e3267114f'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
# Twilio.configure do |config|
#   config.account_sid = account_sid
#   config.auth_token = auth_token
# end

# # and then you can create a new client without parameters
# @client = Twilio::REST::Client.new

@client.messages.create({
  from: '+441290211150',
  to: '+447404042962',
  body: "Thank you! Your order was placed and will be delivered before #{Time.now + (60 * 60)}",
})
end
