
class Send
require 'rubygems'
require 'twilio-ruby'


	def delivery_time
		time = Time.new
		time = "#{time.hour.to_s} + : + #{time.min.to_s}"
	end

	def client
		account_sid = ""
		auth_token = ""
		Twilio::REST::Client.new account_sid, auth_token
	end

	def send_text
		client.messages.create(
		from: "", # Your Twilio number
		to: "",
		body: body_message)
	end

	def body_message
		"Thank you! Your order was placed and will be delivered before #{delivery_time}"
	end

end

Send.new.send_text
# p Send.new.send_text
# p Send.new.delivery_time
# p Send.new.client
