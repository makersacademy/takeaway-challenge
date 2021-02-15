require 'rubygems' 
require 'twilio-ruby'

class SMS 

	def send_message(text)
				account_sid = ENV["TWILIO_ACCOUNT_SID"] 
				auth_token = ENV['TWILIO_AUTH_TOKEN']
				my_phone = ENV['MY_PHONE']
				client = Twilio::REST::Client.new(account_sid, auth_token) 
				
				from = '+447401390119' # Your Twilio number
				to = ENV['MY_PHONE'] # Your mobile phone number
		

		
				client.messages.create(
				from: from,
				to: to,
				body: text
				)
		end

end