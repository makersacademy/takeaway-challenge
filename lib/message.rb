require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Checkout

  	def initialize
    	@client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  	end

  	def send_sms(to, message)
    	@client.messages.create(
      		from: '+441600800013',
      		to: to,
      		body: message
    	)
  	end
  	
end
