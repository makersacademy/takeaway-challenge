

class TextMessage


	def initialize(client: nil)
		@client = client || Twilio::REST::Client.new(twilio[account_sid],twilio[auth_token])	
	end

	def deliver
		"Thank you! Your order was placed and will be delivered before 18:52"
	end
end
