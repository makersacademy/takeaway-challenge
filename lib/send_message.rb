require 'twilio-ruby'
class Send_message
	def initialize(msg)
		# put your own credentials here
		account_sid = 'AC560664b4610ba7bf2cf19151fa515479'
		auth_token = '04e36d973884d324eb4188741f487b72'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token

		@client.account.messages.create({
			:from => '+441334303065',
			:to => '447533987196',
			# :to => '447882135315',
			:body => msg+"\nEnjoy! ⌒°(ᴖ◡ᴖ)°⌒",
		})
	end
end