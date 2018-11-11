# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SendOrder
	def send_sms
		account_sid = 'AC77634ab9c62fbf3d1b3af07b8dde7d1d'
		auth_token = '8c16b6d6ca62695e2a7f7002dfe40fa3'
		client = Twilio::REST::Client.new(account_sid, auth_token)

		from = '+447376010138' # Your Twilio number
		to = '+447376010121' # Your mobile phone number

		client.messages.create(
		from: from,
		to: to,
		body: "Thank you! Your order was placed and will be delivered in the next 60 minutes "
		)
	end
end