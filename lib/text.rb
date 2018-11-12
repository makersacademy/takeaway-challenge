require 'twilio-ruby'
require './config'

class Text

attr_reader :client

	def initialize (config = Config.new)
		@config = config
		@client = Twilio::REST::Client.new(@config.account_sid, @config.auth_token)

		@from = @config.from 
		@to = @config.to
	end
	

	def send_message (total_price)
		client.messages.create(
		from: @from,
		to: @to,
		body: "Thank you for your order: £#{total_price}"
		)
	end
end
