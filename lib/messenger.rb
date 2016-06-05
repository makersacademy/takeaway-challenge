#it understands the sending of texts

require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 

class Messenger

  def initialize(total)
  	@total = total
  end

	def send_text
		account_sid = 'AC785b40a22bde0086eebd26d91cb57831' 
		auth_token = '5f3b4192e7f0fccd93e81805d0f73693' 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		@client.account.messages.create({
			:from => '+441327552064', 
			:to => '+447708605799', 
			:body => "Your order totalling £#{sprintf('%.2f', @total)} will be with you at #{(Time.now + 3600 ).strftime("%H:%M")}. Thank you for the order.",  
		}) 

	end

end