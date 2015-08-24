require 'twilio-ruby'

class Restaurant

	def initialize(twilio_client, twilio_number)
		@client = twilio_client
		@number = twilio_number
	end
	
	def send_confirmation_message(message)
		@client.account.messages.create(
		from: @number, 
      to: "+447729835662",  
      body: message
		)
	end

end