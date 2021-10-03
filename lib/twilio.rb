require 'twilio-ruby'

class TwilioSender

	def initialize

		@client = Twilio::REST::Client.new(
			ENV['ACCOUNT_SID'],
			ENV['AUTH_TOKEN']
			)

  end
	
	def send_text(body)

		@client.messages.create(
			from: '+13205926565',
			to: ENV['PHONE_NUM'],
			body: body
			)

	end

end
