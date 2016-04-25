require 'twilio-ruby'

class SMS

	DEFAULT_MESSAGE = "Thank you! Your order was placed and will be delivered before "

	def initialize(account_sid = 'AC0bbcf29a58f6134e0c73f0273b704282', auth_token = '7b7059df98e20dc74c3b4626e6e18c06', configuration = nil, client = nil)
		@account_sid = account_sid
		@auth_token = auth_token
		@configuration = configuration ||= config
		@client = client ||= Twilio::REST::Client.new(@account_sid, @auth_token)
	end

	def send_message
		@client.messages.create(@configuration)
	end

	def delivery_time
		(time + 3600).strftime("%H:%M")
	end

	private

		def config
			{
				:from => '+441277424446',
				:to => '+447910033569',
				:body => DEFAULT_MESSAGE + delivery_time
			}
		end

		def time
			Time.new
		end

end