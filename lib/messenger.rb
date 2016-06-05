#it understands the sending of texts

require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 
require 'dotenv'
Dotenv.load

class Messenger

  def initialize(total)
  	@total = total
  end

	def send_text
		account_sid = ENV['ACCSID']
		auth_token = ENV['AUTHTOK']
		@client = Twilio::REST::Client.new account_sid, auth_token 
		@client.account.messages.create({
			:from => ENV['TWILNUM'],
			:to => ENV['MYNUM'], 
			:body => "Your order totalling £#{sprintf('%.2f', @total)} will be with you at #{(Time.now + 3600 ).strftime("%H:%M")}. Thank you for the order.",  
		}) 

	end

end