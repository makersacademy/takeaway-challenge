require 'twilio-ruby'

class Restaurant
	
	def send_confirmation_message
		account_sid = 'AC57bd6a35fc71e021da4ca730b6d1294e' 
		auth_token = '4487c5be04356a927a6da0562418fa10' 
		 

		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create(
		from: "+441773252056", 
      to: "+447729835662",   
      body: "Thank you for your order! It will arrive at #{(Time.now + 3600).hour}:#{Time.new.min}"
		)
	end

end