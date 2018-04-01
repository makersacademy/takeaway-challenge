# require 'twilio-ruby'
#
# # put your own credentials here
# account_sid = 'ACdcdde353d226481c3cc28638c6442da7'
# auth_token = '95f4cbb93d6d065bdfd9d46bc1529249'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# @client.api.account.messages.create(
# from: '+447481342537',
# to: '+447934429256',
# body: 'Hey there! This is a test message'
# )
