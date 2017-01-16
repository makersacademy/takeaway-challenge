require 'dotenv'
require 'twilio-ruby'

class SMS
	def send_sms(total)
	Dotenv.load
	account_sid = ENV['ACCOUNT_SID']
	auth_token = ENV['AUTH_TOKEN']
	from = ENV['TWILIO_NUMBER']
	to_num = ENV['PHONE_NUMBER']
	@client = Twilio::REST::Client.new account_sid, auth_token
	@client.account.messages.create({
	        :to => to_num,
	        :from => from,
	        :body => "#{total} and will be delivered before #{deliver_time}"})
	end

private

	def deliver_time
		(Time.now+3600).to_s[11..15]
	end



end
