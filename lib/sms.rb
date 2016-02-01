require 'twilio-ruby' 
class Sms

	def initialize
		account_sid = "ACb7c9c4c1f04a818304894f6c16969a30"
		auth_token = "5e05049b984b4779cef7829b943b8eb4"
		@client = Twilio::REST::Client.new account_sid, auth_token
	end 

	def send
		@client.messages.create(
			from: "+441290211628",
			to: "+447540552750",
			body: "testing"
			)
	end

end