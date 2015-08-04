require 'twilio-ruby'

class Restaurant
	
	def send_confirmation_message
		 

		@client = Twilio::REST::Client.new ENV['TWILIO_AUTH_SID'], ENV['TWILIO_AUTH_TOKEN']
		 
		@client.account.messages.create(
		from: ENV['TWILIO_NUMBER'], 
      to: "+447729835662",  
      body: "Thank you for your order! It will arrive at #{(Time.now + 3600).hour}:#{Time.new.min}"
		)
	end

end