require 'twilio-ruby'

class Delivery
	def text_customer
		@account_sid = 'AC2f4a152920799e258a9c461663d3239a'
		@auth_token = '3a3cb5780128a54b1133ab029628ad9a'
		@client = Twilio::REST::Client.new @account_sid, @auth_token

		@client.account.messages.create({:body => "Thank you! Your order was placed and will be delivered before 18:52",
		    :to => "+441767512049",  
		    :from => "+441767512049"})
		'Your message was sent'
	end
end 