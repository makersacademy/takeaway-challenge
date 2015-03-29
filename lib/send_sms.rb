require 'twilio-ruby'

module Send_sms

	def time
		time_plus_one_hour = Time.now + 1*60*60
		time_plus_one_hour.strftime('%H:%M')
	end

	def send_text

		account_sid = 'ACe5e0e8cfb5029c6915ec74fd1cb978cd'
		auth_token = '{{6f33c79e578d9fa7145e4da889b818fa}}'

		@client = Twilio::REST::Client.new account_sid, auth_token

		message = @client.account.messages.create(:body => "Thank you! Your order has been accepted and will be delivered to you before #{time}",
				:to => "+447817255124",
				:from => "+441253530817")
		puts.message.sid
	end
end