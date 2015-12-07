require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'dotenv'

class Text

def initialize
  # put your own credentials here
  account_sid = 'AC49c1a326793ac7fdaf8635cb8c2201ff'
  auth_token = '11c78e30dfed8ccd4bc329c165976e2e'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token
end


def messege
  @client.account.messages.create({
	:from => ENV["TWILIONUM"],
	:to => ENV["CLIENTNUM"],
	:body => "Thank you! Your order was placed and will be delivered before #{time}",
})
end

def time
  (Time.now + 3600).strftime("%H:%M")
end

end
