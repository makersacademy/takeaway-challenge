require 'twilio-ruby'

class Sms 
	def initialize
		account_sid = "AC7b1231d8c0c14e594fac7a0ddeda5b88"
		auth_token = "3f227450d5be6332ac5997788f0b126e"
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		@from = '+16175551212'
		@to = '+447392293131'
	end 
	
	def send
		@client.messages.create(
			from: @from,
			to: @to ,
			body: "Thank you for your order, it will be delivered withing the next hour!")
	end 
end 
