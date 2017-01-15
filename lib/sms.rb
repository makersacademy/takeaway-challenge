class Sms

	require_relative 'details'
	require 'twilio-ruby'

	def send_sms
		account_sid = Details::ACCOUNT
		auth_token = Details::AUTH

		@client = Twilio::REST::Client.new account_sid, auth_token 

		@client.account.messages.create(
	  	from: "#{Details::FROM}",
	  	to: "#{Details::TO}",
	  	body: "Thanks for your order! Your food should be with you by #{(Time.new + 3600).strftime("%H:%M")} at the latest."
		)
	end

end