require 'twilio-ruby'

class SMS
	def send_sms(total)
	  Dotenv.load
	  ACCOUNT_SID   = ENV['ACCOUNT_SID']
	  AUTH_TOKEN    = ENV['AUTH_TOKEN']
	  PHONE_NUMBER  = ENV['PHONE_NUMBER']
	  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
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
