require 'twilio-ruby'
require 'dotenv/load'

class SmsTool

		def self.send_message(message, number = ENV['NUMBER'])
				time = Time.now + (1 * 60 * 60)
				boot_twilio
				@client.api.account.messages.create(
	  		from: '+442870032047',
	  		to: number,
	  		body: "Thank you! Your order:#{message} was placed and will be delivered before #{time}.")
		end

		def self.boot_twilio
			 @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
		end
end
