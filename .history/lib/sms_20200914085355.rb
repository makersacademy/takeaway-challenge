require 'twilio-ruby'
require 'dotenv'

class Sms 
	def initialize
		account_sid = ENV["TWILIO_ACCOUNT_SID"]
		auth_token = ENV["TWILIO_AUTH_TOKEN"]
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		@from = '+447380318348'
		@to = ENV["VJMOB"]
	end 
	
	def send
		@client.messages.create(
			from: @from,
			to: @to ,
			body: "Thank you for your order, it will be delivered withing the next hour!")
	end 
end 
