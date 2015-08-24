require 'twilio-ruby'

class Restaurant

	def initialize(twilio_client)
		@client = twilio_client
	end
	
	def send_confirmation_message(message)
		@client.account.messages.create(
		from: ENV['TWILIO_NUMBER'], 
      to: "+447729835662",  
      body: message
		)
	end

end