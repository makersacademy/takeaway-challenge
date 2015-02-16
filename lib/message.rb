require 'rubygems'
require 'twilio-ruby' 
 
module Message

	def confirmation
		account_sid = 'AC6fec926a6c240ebfb7669760a3f258a2' 
		auth_token = 'af9b1063fad189910381f90e1c52fed8' 
		
		@client = Twilio::REST::Client.new account_sid, auth_token 
 
		@client.account.messages.create({
			:from => "+441228830269",  
			:body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour+1}"  
		})
	end

end