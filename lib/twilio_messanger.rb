# require 'twilio-ruby' # put your own credentials here
# account_sid = '<AccountSid>'
# auth_token = '<AuthToken>'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# @client.account.messages.create({
#     :to => '<ToNumber>',
#     :from => '<FromNumber>',
#     :body => '<BodyText>',
# })

#
# TWILIO_ACCOUNT_SID = '####'
# TWILIO_AUTH_TOKEN = '####'
# TWILIO_NUMBER = '+44####'
# TWILIO_MY_NUMBER = '+44####'

#
# like this in the class responsible for the api call: ENV['TWILIO_ACCOUNT_SID']
# so account_sid = ENV['TWILIO_ACCOUNT_SID']
# and in the .env file TWILIO_ACCOUNT_SID = ‘my sid'
# gitignore the env file
