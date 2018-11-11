require 'twilio-ruby'

class Text

attr_reader :client

	def initialize
		account_sid = 'ACa1c932796ecd271062330acc94582c1b'
		auth_token = '6d0f848aed9f061211ad09f5c76b84a0'
		@client = Twilio::REST::Client.new(account_sid, auth_token)

		@from = '+447481338117' 
		@to = '+447738623761'
	end
	

	def send_message (total_price)
		client.messages.create(
		from: @from,
		to: @to,
		body: "Thank you for your order: £#{total_price}"
		)
	end
end
