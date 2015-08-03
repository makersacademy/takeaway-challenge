require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

module Send_sms
# put your own credentials here
  def do
    account_sid = 'AC98d3efd00c4a9a7bbb98fc8f86d2308a'
    auth_token = '[auth token]'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441761502062',
      :to => '+447496548640',
      :body => 'Cojones',
  })
  end
end
