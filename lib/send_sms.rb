require "twilio-ruby"
require 'dotenv/load'

TWILIO_PHONE_NUMBER = '+17158012510'

class TwilioClient
	attr_reader :client

	def initialize
		@account_id = ENV['TWILIO_ACCOUNT_ID']
		@auth_token = ENV['TWILIO_AUTH_TOKEN']
		@my_number = ENV['MY_PHONE_NUMBER']
		@client = Twilio::REST::Client.new(@account_id, @auth_token)
	end

	def send_sms(to = @my_number, from = TWILIO_PHONE_NUMBER, confirmation_sms)
		@client.messages.create(
			to: to,
			from: from,
			body: confirmation_sms
		)
	end
end
