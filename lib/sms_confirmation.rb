require 'twilio-ruby'
require 'sinatra'
require 'active_support'


class SmsConfirmation


	def send
		account_sid = ENV['TWILIO_ACCOUNT_SID']
		auth_token = ENV['TWILIO_AUTH_TOKEN']
		time = Time + 1.hours
		client = Twilio::REST::Client.new(account_sid, auth_token)

		client.account.messages.create(
		  from: '+447903107385',
		  to: '+447903107385',
		  body: 'Thanks for your order. It will be delivered before #{time}.'
		)
	end

end

