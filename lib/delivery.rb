require 'twilio-ruby'

class Delivery
	def text_customer
		account_sid = 'AC2f4a152920799e258a9c461663d3239a'
		auth_token = ENV['AUTH_TOKEN']
		@client = Twilio::REST::Client.new account_sid, auth_token

		@client.account.messages.create({
		    :to => "+447738616122",  
		    :from => "+441767512049",
		    :body => "Thank you! Your order was placed and will be delivered before 18:52"})
		'Your message was sent'
	end
end 