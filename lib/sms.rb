require "twilio-ruby"

class SMS

	TIME_FORMAT = "%H:%M"

	def initialize(config, client:Twilio::REST::Client.new(config[:account_sid], config[:auth_token]))
		@client = client
		@config = config
	end
	def send #changed due to sam
		client.messages.create(message_args)
	end

	private 

	attr_reader :client, :config

	def message_args #added cause of sam since makes tons of sense
		{
			from: config[:from],
			to: config[:to],
			body: config[:body] % estimated_time
		}
		#format(config[:body], estimated_time)
	end

	def estimated_time
		(Time.now + (60 * 60)).strftime(TIME_FORMAT)
	end
end
	# what i had before inside my send method
	# account_sid = ""
	# auth_token = ""
	# client = Twilio::REST::Client.new(account_sid, auth_token)
	# from = ""
	# client.account.messages.create(:from => from,:to => from, 
	#:body => "Thank you! Your order was placed 
	#and will be delivered before #{estimated_time}"