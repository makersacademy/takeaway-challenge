require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Twilio_credentials
  # put your own credentials here
  account_sid = 'AC98d3efd00c4a9a7bbb98fc8f86d2308a'
  auth_token = '7872f37eb4c6ff5b8dd181d98f99a4ba'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  # @client.account.messages.create({
  #   :from => '+44 1761502062',
  #   :to => '+44 7496548640',
  #   :body => 'First Trial', #
  # })
end