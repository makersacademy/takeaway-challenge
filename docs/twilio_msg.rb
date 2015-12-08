
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

require 'dotenv'
Dotenv.load

class Text

# put your own credentials here

# set up a client to talk to the Twilio REST API
def initialize
	@account_sid = ENV["TWILIOSID"]
	@auth_token = ENV["TWILIOTOKEN"]
	@client = Twilio::REST::Client.new(@account_sid, @auth_token)
end

	def confirm_order(message)
			@client.account.messages.create({
			:from => '+441233801280',
			:to => ENV["MOBILENUMBER"],
			:body => (message),
			})
			"You will receive a confirmation text shortly"
	end

end
