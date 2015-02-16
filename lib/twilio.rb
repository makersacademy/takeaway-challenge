require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 
 
 module Sms

	def time
		@time_ahead = Time.new + (60*60)
	end

	 def send_text
	# put your own credentials here 
	account_sid = 'AC700862d70072900720bd27ca88da1963' 
	auth_token = '[AuthToken]' 
	 
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.messages.create({
		:from => '+441158240706',  
		:to => '+4407587846243', 
		:body => 'Thanks for placing your order at the Zombie restaurant, your brains and human meat will be delivered by the ghostrider in #{time}' 
	})

	end

end