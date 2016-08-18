require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

	def initialize (client = (Twilio::REST::Client.new(ENV['SID'], ENV['AUTH'])))
		@client = client
	end

	def send(message)
		@client.messages.create(
	  from: '+441346277049',
	  to: '+447825874727',
	  body: message)
	end

end