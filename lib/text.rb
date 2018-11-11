require 'twilio-ruby'

class Text
	account_sid = '***REMOVED***'
	auth_token = '***REMOVED***'
	client = Twilio::REST::Client.new(account_sid, auth_token)

	from = '+447481338117' 
	to = '***REMOVED***'

	

	def send_message (total_price)
		client.messages.create(
		from: from,
		to: to,
		body: "Thank you for your order: £#{total_price}"
		)
	end
end